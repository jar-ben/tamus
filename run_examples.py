import time
import must
from uppaalHelpers import path_analysis


if __name__ == '__main__':

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

    f = open("examples/paper_benchmarks/literature_benchmarks.txt", "w")
    for fi in fis:
        print fi[0]
        f.write("Model: ")
        f.write(fi[0] + "\n")
        f.write("Query: ")
        f.write(fi[1] + "\n")
        f.write("TA: ")
        f.write(fi[2] + "\n")
        t = must.Tamus(fi[0], fi[1], fi[2])
        t.useGrow = True
        t.timelimit = 1000000
        t.verbosity = 0
        t.use_unsat_cores = True
        t.explorer.all_msrs = False
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
