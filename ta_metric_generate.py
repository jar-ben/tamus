import time
import argparse
import signal
from subprocess32 import Popen, PIPE, TimeoutExpired
import os
import pickle
from uppaalHelpers import example_generator


def task_results(path, task, path_analysis, run_imitator=False):
    if not os.path.exists(path):
        os.makedirs(path)
    file_names = example_generator.generate_benchmarks(folder=path)
    timelimit = 1200
    results = dict()
    for filename in file_names:
        if "30" in filename:
            continue
        result = dict()
        start_time = time.time()
        cmd = "python tamus.py --task " + task + " "
        if path_analysis:
            cmd += "--path-analysis "
        if run_imitator:
            cmd += "--run_imitator_on_msr "
        cmd += path + filename + ".xml " + path + filename + ".q " + "TA"
        print "\n\n\n"
        print cmd
        with Popen(cmd, shell=True, stdout=PIPE, preexec_fn=os.setsid) as process:
            try:
                output = process.communicate(timeout=timelimit)[0]
            except TimeoutExpired:
                os.killpg(process.pid, signal.SIGTERM)  # send signal to the process group
        print ""
        print output
        print filename
        time_passed = time.time() - start_time
        print time_passed
        result["time_passed"] = time_passed
        result["checks"] = find_from_output(output, "Performed reachability checks:")
        result["union of MSRs"] = find_from_output(output, "union of MSRs:")
        result["intersection of MSRs"] = find_from_output(output, "intersection of MSRs")
        results[filename] = result
    f = open(path + task + "_path_analysis_generate_results.pkl", "wb")
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
    parser.add_argument("--pasba", action='store_true')
    parser.add_argument("--maxsba", action='store_true')
    parser.add_argument("--mineba", action='store_true')
    parser.add_argument("--marco", action='store_true')
    parser.add_argument("--remus", action='store_true')
    parser.add_argument("--path-analysis", action='store_true')
    parser.add_argument("--run_imitator_on_msr", action='store_true',
                        help="After finding minimal msrs, runs imitator on them and their union.")
    args = parser.parse_args()

    if args.eba:
        task_results("examples/generator-eba-path-analysis/", "eba", args.path_analysis)
    if args.remus:
        task_results("examples/generator-remus-analysis/", "remus", args.path_analysis)
    if args.marco:
        task_results("examples/generator-marco-analysis/", "marco", args.path_analysis)
    if args.sba:
        task_results("examples/generator-sba-path-analysis/", "sba", args.path_analysis)
    if args.maxsba:
        task_results("examples/generator-maxsba/", "maxsba", args.path_analysis)
    if args.mineba:
        task_results("examples/generator-mineba/", "mineba", args.path_analysis, args.run_imitator_on_msr)
    if args.pasba:
        task_results("examples/generator-pasba-path-analysis/", "pasba", args.path_analysis)
