import time
import tamus
from uppaalHelpers import path_analysis
import argparse

from subprocess32 import Popen, PIPE, TimeoutExpired

from uppaalHelpers import xml_to_imi

import os

import signal


if __name__ == '__main__':
    parser = argparse.ArgumentParser(
        "TAMUS - a tool for relaxing reachability properties in Time Automatas based on Minimal Sufficinet Reductions (MRS) and linear programming.")
    parser.add_argument("--task", choices=["msr", "mmsr", "mg", "mmg", "amsr", "amg", "amsramg"],
                        help="Choose the computation taks: msr - an MSR, mmsr - a minimum MSR, mg - an MG, mmg - a minimum MG, amsr - all MSRs, amg - all MGs, amsramg - all MSRs and MGs.",
                        default="mmsr")

    args = parser.parse_args()

    fis = [("examples/paper_benchmarks/literature_benchmarks/accel/accel_1000-uppaal_fixed_mutated.xml",
            "examples/paper_benchmarks/literature_benchmarks/accel/accel_1000-uppaal.q", "pta"),
           ("examples/paper_benchmarks/literature_benchmarks/rcp/RCP-uppaal_fixed_mutated.xml",
            "examples/paper_benchmarks/literature_benchmarks/rcp/RCP-uppaal.q", "All"),
           ("examples/paper_benchmarks/literature_benchmarks/jlr/JLR13-3tasks-npfp-100-2-uppaal_fixed.xml",
            "examples/paper_benchmarks/literature_benchmarks/jlr/JLR13-3tasks-npfp-100-2-uppaal.q", "sched"),
           ("examples/paper_benchmarks/literature_benchmarks/CAS/CAS_mutated.xml",
            "examples/paper_benchmarks/literature_benchmarks/CAS/cas.q", "System"),
           ("examples/paper_benchmarks/literature_benchmarks/coffee/coffee-uppaal_mutated.xml",
            "examples/paper_benchmarks/literature_benchmarks/coffee/coffee-uppaal.q", "All"),
           ("examples/paper_benchmarks/literature_benchmarks/jobshop/maler_4_4-uppaal_fixed_mutated.xml",
            "examples/paper_benchmarks/literature_benchmarks/jobshop/maler_4_4-uppaal.q", "All"),
           ("examples/paper_benchmarks/literature_benchmarks/pipeline/Pipeline-KP12-3-3-uppaal_fixed_mutated.xml",
            "examples/paper_benchmarks/literature_benchmarks/pipeline/Pipeline-KP12-3-3-uppaal.q", "All"),
           ("examples/paper_benchmarks/literature_benchmarks/simop/simop3-uppaal_fixed_mutated.xml",
            "examples/paper_benchmarks/literature_benchmarks/simop/simop3-uppaal.q", "All"),
           ("examples/paper_benchmarks/literature_benchmarks/fischer/fischerHRSV02-2-uppaal_fixed.xml",
            "examples/paper_benchmarks/literature_benchmarks/fischer/fischerHRSV02.q", "All"),
           ("examples/paper_benchmarks/literature_benchmarks/wfas/WFAS-BBLS15-uppaal_fixed.xml",
            "examples/paper_benchmarks/literature_benchmarks/wfas/WFAS-BBLS15-uppaal.q", "controller")]

    if args.task == "mmsr":
        f = open("examples/paper_benchmarks/literature_benchmarks.txt", "w")
        for fi in fis:
            print fi[0]
            f.write("Model: ")
            f.write(fi[0] + "\n")
            f.write("Query: ")
            f.write(fi[1] + "\n")
            f.write("TA: ")
            f.write(fi[2] + "\n")
            args = argparse.Namespace()
            args.run_imitator_on_mg = False
            t = tamus.Tamus(fi[0], fi[1], fi[2], args)

            t.timelimit = 1000000
            t.verbosity = 0
            f.write("is the target location reachable?" + str(t.is_sufficient([])[0]) + "\n")
            start_time = time.clock()
            try:
                t.run()
            except:
                f.write("excexption" + "\n")
            f.write("MSR computation time: " + str(time.clock()-start_time) + "\n")
            f.write("Constraint count: " + str(len(t.TA.constraint_registry)) + "\n")
            f.write('Number of checks ' + str(t.stats['checks']) + "\n")

            start_time = time.clock()
            msres, constraints, traces = t.get_MSRes()
            msres_size = [len(m) for m in msres]
            min_size = min(msres_size)
            min_msres_indexes = [i for i in range(len(msres_size)) if msres_size[i] == min_size]
            # MILP analysis for one of them.
            ind = min_msres_indexes[0]
            delays, parameters = path_analysis.find_parameters(t.TA, traces[ind], msres[ind])
            milp_time = time.clock() - start_time
            sum_param = sum(parameters)
            if not ("coffee" in fi[0] or "CAS" in fi[0]):
                milp_time = "-"
                sum_param = "-"
            f.write("MILP computation time: " + str(milp_time) + "\n")
            f.write("Optimal MILP cost: " + str(sum_param) + "\n")
            f.write("Min MSR size: " + str(min_size) + "\n")
            print("")
            f.write("\n")
    else:
        f = open("examples/paper_benchmarks/literature_benchmarks_mg.txt", "w")
        for fi in fis:
            print fi[0]
            f.write("Model: ")
            f.write(fi[0] + "\n")
            f.write("Query: ")
            f.write(fi[1] + "\n")
            f.write("TA: ")
            f.write(fi[2] + "\n")
            args = argparse.Namespace()
            args.run_imitator_on_mg = False
            t = tamus.Tamus(fi[0], fi[1], fi[2], args)
            t.task = "mmg"
            t.timelimit = 1000000
            t.verbosity = 0
            f.write("is the target location reachable?" + str(t.is_sufficient([])[0]) + "\n")
            start_time = time.clock()
            try:
                t.minimumMG(allMGs=False)
            except:
                f.write("excexption" + "\n")
            f.write("MG computation time: " + str(time.clock() - start_time) + "\n")
            f.write("Constraint count: " + str(len(t.TA.constraint_registry)) + "\n")
            f.write('Number of checks ' + str(t.stats['checks']) + "\n")

            mgs, constraints = t.get_MGs()

            # Minimal mgs:
            mgs_size = [len(m) for m in mgs]
            min_size = min(mgs_size)
            min_mgs_indexes = [i for i in range(len(mgs_size)) if mgs_size[i] == min_size]
            mg = mgs[min_mgs_indexes[0]]
            relax_list = [c for c in t.clist]

            for c in mg:  # create the list that will be removed from the model
                relax_list.remove(c)

            new_templates, parameter_count = t.TA.generate_relaxed_and_parametrized_templates(relax_list, mg)
            declaraion_of_the_system = t.model.declaration
            process_template_pair_of_the_system = t.model.system
            # print set(constraints[0])
            imi_name, imiporp_name = xml_to_imi.create_imitator_on_mg(new_templates,
                                                                      declaraion_of_the_system,
                                                                      process_template_pair_of_the_system,
                                                                      t.model_file,
                                                                      t.query_file,  # 1)
                                                                      parameter_count)
            output_file = imi_name.split(".imi")[0]
            command = "imitator " + imi_name + " " + imiporp_name + " -output-prefix " + output_file + " -verbose mute"
            f.write("running " + command + "\n")
            start_time = time.clock()
            with Popen(command, shell=True, stdout=PIPE, preexec_fn=os.setsid) as process:
                try:
                    output = process.communicate(timeout=1200)[0]
                    parameter_vals, total_sum = xml_to_imi.find_maximum_parameter_values(output_file + ".res",
                                                                                        parameter_count)
                    f.write("Total sum for maximum parameter valuations: "+str(total_sum)+"\n")
                    f.write("Imitator Time: " + str(time.clock()-start_time) + "\n")

                except TimeoutExpired:
                    os.killpg(process.pid, signal.SIGINT)  # send signal to the process group
                    output = process.communicate()[0]
                    f.write("Timeout at 20 minutes\n")



            f.write("\n")
