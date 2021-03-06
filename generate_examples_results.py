import time
import must
from uppaalHelpers import path_analysis
from uppaalHelpers import example_generator
import pickle
import os


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
        t = must.Tamus(path + filename + ".xml", path + filename + ".q", "TA")
        t.verbosity = 0
        t.timelimit = 600
        t.grow_extension = True
        t.use_unsat_cores = True
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


if __name__ == '__main__':
    path = 'examples/generator-g/'
    if not os.path.exists(path):
        os.makedirs(path)
    results = generate_analyze(path)
    # results = pickle.load(open("examples/generator/results.pkl", "rb"))

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





