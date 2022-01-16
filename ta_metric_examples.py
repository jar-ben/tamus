import time
import argparse
import signal
from subprocess32 import Popen, PIPE, TimeoutExpired
import os
import pickle


def task_results(file_names, task, path_analysis, run_imitator=False):
    timelimit = 1200
    results = dict()
    for filename, query_name, ta in file_names:
        result = dict()
        start_time = time.time()
        cmd = "python tamus.py --task " + task + " "
        if path_analysis:
            cmd += "--path-analysis "
        if run_imitator:
            cmd += "--run_imitator_on_msr "
        cmd += filename + " " + query_name + " " + ta
        print "\n\n\n"
        print cmd
        with Popen(cmd, shell=True, stdout=PIPE, preexec_fn=os.setsid) as process:
            try:
                output = process.communicate(timeout=timelimit)[0]
                print(type(output))
            except TimeoutExpired:
                os.killpg(process.pid, signal.SIGTERM)  # send signal to the process group

        print output
        print filename
        time_passed = time.time() - start_time
        print time_passed
        result["time_passed"] = time_passed
        result["checks"] = find_from_output(output, "Performed reachability checks:")
        result["union of MSRs"] = find_from_output(output, "union of MSRs:")
        result["intersection of MSRs"] = find_from_output(output, "intersection of MSRs")
        results[filename] = result
    f = open("examples/" + task + "_path_analysis_results.pkl", "wb")
    pickle.dump(results, f)
    f.close()


def find_from_output(output, query):
    for line in output:
        if query in line:
            return line.split(":")[1].strip()
    return "-1"


if __name__ == '__main__':
    parser = argparse.ArgumentParser(
        "TAMUS - a tool for relaxing reachability properties in Time Automatas based on Minimal Sufficinet Reductions (MRS) and linear programming.")
    parser.add_argument("--eba", action='store_true')
    parser.add_argument("--sba", action='store_true')
    parser.add_argument("--maxsba", action='store_true')
    parser.add_argument("--marco", action='store_true')
    parser.add_argument("--remus", action='store_true')
    parser.add_argument("--mineba", action='store_true')
    parser.add_argument("--path-analysis", action='store_true')
    parser.add_argument("--run_imitator_on_msr", action='store_true',
                        help="After finding minimal msrs, runs imitator on them and their union.")
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

    if args.eba:
        task_results(fis, "eba", args.path_analysis)
    if args.sba:
        task_results(fis, "sba", args.path_analysis)
    if args.remus:
        task_results(fis, "remus", args.path_analysis)
    if args.marco:
        task_results(fis, "marco", args.path_analysis)
    if args.maxsba:
        task_results(fis, "maxsba", args.path_analysis)
    if args.mineba:
        task_results(fis, "mineba", args.path_analysis, args.run_imitator_on_msr)
