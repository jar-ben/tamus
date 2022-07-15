import os
import signal
import sys
import time
from subprocess import PIPE, Popen, TimeoutExpired

if __name__ == '__main__':
    timelimit = int(sys.argv[1])
    f = open("results.txt", "w")
    fis = ["accel/accel_1000_tamus",
           "CAS/CAS_tamus",
           "coffee/coffee_tamus",
           "fischer/fischerHRSV02-2_tamus",
           "jlr/JLR13-3tasks-npfp-100-2_tamus",
           "jobshop/maler_4_4_tamus",
           "pipeline/Pipeline-KP12-3-3_tamus",
           "rcp/RCP_tamus",
           "simop/simop3_tamus",
           "wfas/WFAS_tamus"]

    for fi in fis:
        last_part = fi[fi.find("/")+1:]

        # base model
        start_time = time.time()
        cmd = "imitator tamus_examples/" + fi + \
              ".imi tamus_examples/" + fi + ".imiprop"
        with Popen(cmd, shell=True, stdout=PIPE, preexec_fn=os.setsid) as process:
            try:
                output = process.communicate(timeout=timelimit)[0]
            except TimeoutExpired:
                # send signal to the process group
                os.killpg(process.pid, signal.SIGINT)
                output = process.communicate()[0]
        elapsed_time = time.time() - start_time
        print(time.time() - start_time)

        mv_cmd = "mv " + last_part +\
                 ".res tamus_examples/results/imitator_output && " \
                 "mv tamus_examples/results/imitator_output/" + last_part + ".res " \
                 "tamus_examples/results/imitator_output/" + last_part + "_whole.res "
        with Popen(mv_cmd, shell=True, stdout=PIPE, preexec_fn=os.setsid) as process:
            try:
                process.communicate()
            except:
                pass
        f.write("Model: " + fi + "\n")
        f.write("Time: " + str(elapsed_time) + "\n\n")

        # base model with counterexample
        start_time = time.time()
        cmd = "imitator tamus_examples/" + fi + \
              ".imi tamus_examples/" + fi + "_witness.imiprop"
        with Popen(cmd, shell=True, stdout=PIPE, preexec_fn=os.setsid) as process:
            try:
                output = process.communicate(timeout=timelimit)[0]
            except TimeoutExpired:
                # send signal to the process group
                os.killpg(process.pid, signal.SIGINT)
                output = process.communicate()[0]
        elapsed_time = time.time() - start_time
        print(time.time() - start_time)

        mv_cmd = "mv " + last_part +\
                 ".res tamus_examples/results/imitator_output && " \
                 "mv tamus_examples/results/imitator_output/" + last_part + ".res " \
                 "tamus_examples/results/imitator_output/" + last_part + "_counter.res "
        with Popen(mv_cmd, shell=True, stdout=PIPE, preexec_fn=os.setsid) as process:
            try:
                process.communicate()
            except:
                pass
        f.write("Model: " + fi + "\n")
        f.write("Time: " + str(elapsed_time) + "\n\n")

        # msr model
        start_time = time.time()
        cmd = "imitator tamus_examples/" + fi + \
              "_msr.imi tamus_examples/" + fi + ".imiprop"
        with Popen(cmd, shell=True, stdout=PIPE, preexec_fn=os.setsid) as process:
            try:
                output = process.communicate(timeout=timelimit)[0]
            except TimeoutExpired:
                # send signal to the process group
                os.killpg(process.pid, signal.SIGINT)
                output = process.communicate()[0]
        elapsed_time = time.time() - start_time
        print(time.time() - start_time)

        mv_cmd = "mv " + last_part +\
                 "_msr.res tamus_examples/results/imitator_output && " \
                 "mv tamus_examples/results/imitator_output/" + last_part + "_msr.res " \
                 "tamus_examples/results/imitator_output/" + last_part + "_msr_whole.res "
        with Popen(mv_cmd, shell=True, stdout=PIPE, preexec_fn=os.setsid) as process:
            try:
                process.communicate()
            except:
                pass
        f.write("Model: " + fi + "\n")
        f.write("Time: " + str(elapsed_time) + "\n\n")

        # msr model with counterexample
        start_time = time.time()
        cmd = "imitator tamus_examples/" + fi + \
              "_msr.imi tamus_examples/" + fi + "_witness.imiprop"
        with Popen(cmd, shell=True, stdout=PIPE, preexec_fn=os.setsid) as process:
            try:
                output = process.communicate(timeout=timelimit)[0]
            except TimeoutExpired:
                # send signal to the process group
                os.killpg(process.pid, signal.SIGINT)
                output = process.communicate()[0]
        elapsed_time = time.time() - start_time
        print(time.time() - start_time)

        mv_cmd = "mv " + last_part +\
                 "_msr.res tamus_examples/results/imitator_output && " \
                 "mv tamus_examples/results/imitator_output/" + last_part + "_msr.res " \
                 "tamus_examples/results/imitator_output/" + last_part + "_msr_counter.res "
        with Popen(mv_cmd, shell=True, stdout=PIPE, preexec_fn=os.setsid) as process:
            try:
                process.communicate()
            except:
                pass
        f.write("Model: " + fi + "\n")
        f.write("Time: " + str(elapsed_time) + "\n\n")

    fis = ["generator_examples/3/3-12-1",
           "generator_examples/3/3-12-2",
           "generator_examples/3/3-18-1",
           "generator_examples/3/3-18-2",
           "generator_examples/3/3-24-1",
           "generator_examples/3/3-24-2",
           "generator_examples/3/3-30-1",
           "generator_examples/3/3-30-2",
           "generator_examples/5/5-12-1",
           "generator_examples/5/5-12-2",
           "generator_examples/5/5-18-1",
           "generator_examples/5/5-18-2",
           "generator_examples/7/7-12-1",
           "generator_examples/7/7-12-2"
           ]

    for fi in fis:
        last_part = fi[21:]
        # base model
        start_time = time.time()
        cmd = "imitator tamus_examples/" + fi + \
              ".imi tamus_examples/" + fi + ".imiprop"
        with Popen(cmd, shell=True, stdout=PIPE, preexec_fn=os.setsid) as process:
            try:
                output = process.communicate(timeout=timelimit)[0]
            except TimeoutExpired:
                # send signal to the process group
                os.killpg(process.pid, signal.SIGINT)
                output = process.communicate()[0]
        elapsed_time = time.time() - start_time
        print(time.time() - start_time)

        mv_cmd = "mv " + last_part +\
                 ".res tamus_examples/results/imitator_output && " \
                 "mv tamus_examples/results/imitator_output/" + last_part + ".res " \
                 "tamus_examples/results/imitator_output/" + last_part + "_whole.res "
        with Popen(mv_cmd, shell=True, stdout=PIPE, preexec_fn=os.setsid) as process:
            try:
                process.communicate()
            except:
                pass
        f.write("Model: " + fi + "\n")
        f.write("Time: " + str(elapsed_time) + "\n\n")

        # base model with counterexample
        start_time = time.time()
        cmd = "imitator tamus_examples/" + fi + \
              ".imi tamus_examples/" + fi + "_witness.imiprop"
        with Popen(cmd, shell=True, stdout=PIPE, preexec_fn=os.setsid) as process:
            try:
                output = process.communicate(timeout=timelimit)[0]
            except TimeoutExpired:
                # send signal to the process group
                os.killpg(process.pid, signal.SIGINT)
                output = process.communicate()[0]
        elapsed_time = time.time() - start_time
        print(time.time() - start_time)

        mv_cmd = "mv " + last_part +\
                 ".res tamus_examples/results/imitator_output && " \
                 "mv tamus_examples/results/imitator_output/" + last_part + ".res " \
                 "tamus_examples/results/imitator_output/" + last_part + "_counter.res "
        with Popen(mv_cmd, shell=True, stdout=PIPE, preexec_fn=os.setsid) as process:
            try:
                process.communicate()
            except:
                pass
        f.write("Model: " + fi + "\n")
        f.write("Time: " + str(elapsed_time) + "\n\n")
