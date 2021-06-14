import time
import tamus
from uppaalHelpers import path_analysis
from uppaalHelpers import example_generator
import pickle
import os
import argparse
from uppaalHelpers import xml_to_imi


def generate_analyze(path):
    file_names = example_generator.generate_benchmarks(folder=path)
    results = dict()

    for filename in file_names:
        result = dict()
        print filename
        variables = filename[filename.find("test") + 4:]
        variables = list(map(int, variables.split("_")))
        print("clock count, path length, path count")
        print(variables)

        start_time = time.clock()
        args = argparse.Namespace()
        args.run_imitator_on_mg = False
        t = tamus.Tamus(path + filename + ".xml", path + filename + ".q", "TA", args)
        t.verbosity = 0
        t.timelimit = 600
        result['constraint_count'] = len(t.TA.constraint_registry)
        print("Constraint count: " + str(result['constraint_count']))

        t.run()
        result['msr_time'] = time.clock() - start_time
        print("MSR computation time: " + str(result['msr_time']))
        result['stats'] = t.stats
        print('Number of checks ' + str(result['stats']['checks']))
        start_time = time.clock()
        msres, constraints, traces = t.get_MSRes()
        msres_size = [len(m) for m in msres]
        min_size = min(msres_size)
        result['min_msr_size'] = min_size
        min_msres_indexes = [i for i in range(len(msres_size)) if msres_size[i] == min_size]
        # MILP analysis for one of them.
        ind = min_msres_indexes[0]
        delays, parameters = path_analysis.find_parameters(t.TA, traces[ind], msres[ind])
        result["milp_comp_time"] = time.clock() - start_time
        print("MILP computation time: " + str(result["milp_comp_time"]))

        result["optimal_cost"] = sum(parameters)
        print("Optimal MILP cost: " + str(result["optimal_cost"]))

        print("")
        results[tuple(variables)] = result

    f = open(path + "results.pkl", "wb")
    pickle.dump(results, f)
    f.close()
    return results


def generate_analyze_mg(path, run_imi_on_mg=False):
    file_names = example_generator.generate_benchmarks(folder=path)
    results = dict()

    for filename in file_names:
        result = dict()
        print filename
        variables = filename[filename.find("test") + 4:]
        variables = list(map(int, variables.split("_")))
        print("clock count, path length, path count")
        print(variables)

        start_time = time.clock()
        args = argparse.Namespace()
        args.run_imitator_on_mg = False
        t = tamus.Tamus(path + filename + ".xml", path + filename + ".q", "TA", args)
        t.verbosity = 0
        t.timelimit = 600
        t.task = "mmg"
        result['constraint_count'] = len(t.TA.constraint_registry)
        print("Constraint count: " + str(result['constraint_count']))

        t.run()
        result['mmg_time'] = time.clock() - start_time
        print("MMG computation time: " + str(result['mmg_time']))
        result['stats'] = t.stats
        print('Number of checks ' + str(result['stats']['checks']))

        start_time = time.clock()
        mgs, constraints = t.get_MGs()
        mgs_size = [len(m) for m in mgs]
        min_size = min(mgs_size)
        result['min_mg_size'] = min_size
        min_mgs_indexes = [i for i in range(len(mgs_size)) if mgs_size[i] == min_size]
        # Imi analysis for one of them.

        ind = min_mgs_indexes[0]
        mg = mgs[ind]

        result["mg_imitator_time"] = -1
        result["optimal_cost"] = -1
        if run_imi_on_mg:
            relax_list = [cons for cons in t.clist]
            for cons in mg:  # create the list that will be removed from the model
                relax_list.remove(cons)
            new_templates, parameter_count = t.TA.generate_relaxed_and_parametrized_templates(relax_list, mg)
            declaraion_of_the_system = t.model.declaration
            process_template_pair_of_the_system = t.model.system
            imi_name, imiporp_name = xml_to_imi.create_imitator_on_mg(new_templates,
                                                                      declaraion_of_the_system,
                                                                      process_template_pair_of_the_system,
                                                                      t.model_file,
                                                                      t.query_file,
                                                                      parameter_count)
            output_file = t.query_file.split(".q")[0]
            command = "imitator " + imi_name + " " + imiporp_name + " -output-prefix " + output_file + " -verbose mute"
            start_time = time.clock()
            os.system(command)
            result["mg_imitator_time"] = time.clock() - start_time
            print(time.clock(), start_time, result["mg_imitator_time"])

            parameter_vals, total_sum = xml_to_imi.find_maximum_parameter_values(output_file + ".res", parameter_count)
            result["optimal_cost"] = total_sum

            results[tuple(variables)] = result

    f = open(path + "results.pkl", "wb")
    pickle.dump(results, f)
    f.close()
    return results


if __name__ == '__main__':
    parser = argparse.ArgumentParser(
        "TAMUS - a tool for relaxing reachability properties in Time Automatas based on Minimal Sufficinet Reductions (MRS) and linear programming.")
    parser.add_argument("--task", choices=["msr", "mmsr", "mg", "mmg", "amsr", "amg", "amsramg"],
                        help="Choose the computation taks: msr - an MSR, mmsr - a minimum MSR, mg - an MG, mmg - a minimum MG, amsr - all MSRs, amg - all MGs, amsramg - all MSRs and MGs.",
                        default="mmsr")
    parser.add_argument("--run_imitator_on_mg", action='store_true',
                        help="After fnding minimal guarantee, runs imitator on it. This value does not have effect if any task other than mmg is selected.")
    args = parser.parse_args()

    if args.task == "mmsr":
        path = 'examples/generator-msr/'
        if not os.path.exists(path):
            os.makedirs(path)
        results = generate_analyze(path)
        # results = pickle.load(open("examples/generator-msr/results.pkl", "rb"))

        for M in [6, 12, 18, 24, 30]:
            for p in [1,2]:
                row = ""
                for c in [3, 5, 7]:
                    r = results[(c,M,p)]
                    tableTA = "$\TA_{("+str(c)+","+str(p)+","+str(M)+")}$ & "
                    data = str(r['constraint_count']) + " & " \
                           + str(r['min_msr_size']) + " & " \
                           + str(r['stats']['checks']) + " & " \
                           + "{:.2f}".format(r['msr_time']) + " & " \
                           + str(int(r['optimal_cost'])) +  " & "
                    row += tableTA + data
                row = row[:-2] +  "\\\\"
                print(row)
            print("\hline")
    else:
        path = 'examples/generator-mg/'
        if not os.path.exists(path):
            os.makedirs(path)
        results = generate_analyze_mg(path, args.run_imitator_on_mg)
        # results = pickle.load(open("examples/generator-mg/results.pkl", "rb"))

        for M in [6, 12, 18, 24, 30]:
            for p in [1, 2]:
                row = ""
                for c in [3, 5, 7]:
                    r = results[(c, M, p)]
                    tableTA = "$\TA_{(" + str(c) + "," + str(p) + "," + str(M) + ")}$ & "
                    data = str(r['constraint_count']) + " & " \
                           + str(r['min_mg_size']) + " & " \
                           + str(r['stats']['checks']) + " & " \
                           + "{:.2f}".format(r['mmg_time']) + " & " \
                           + str(int(r['optimal_cost'])) + " & " \
                           #+ "{:.3f}".format(r['mg_imitator_time']) + " & "
                    row += tableTA + data
                row = row[:-2] + "\\\\"
                print(row)
            print("\hline")




