import sys
import time
import argparse
import signal
import os

from explorer import Explorer
from uppaalHelpers import ta_helper
from uppaalHelpers import timed_automata
from uppaalHelpers import path_analysis
from uppaalHelpers import xml_to_imi


class Tamus:
    def __init__(self, model_file, query_file, template_name, args):
        self.model_file = model_file # file name
        self.query_file = query_file # file name
        self.template_name = template_name
        self.args = args
        # self.model stores the network of ta from model_file
        # template is the TA of interest for which the constraint analysis is performed.
        # template in self.model is modified during the computation. A modified TA is set for each
        # verification step (verifyta is called).
        # self.location is the target location
        if template_name == 'All':
            self.model, templates = ta_helper.get_templates(self.model_file)
            self.TA = timed_automata.TimedAutomata()
            self.TA.initialize_from_templates(templates)

        else:
            self.model, template, self.location = ta_helper.get_template(self.model_file,
                                                                         self.query_file,
                                                                         template_name)
            self.TA = timed_automata.TimedAutomata()
            self.TA.initialize_from_template(template)

        # Constraint lists for all simple paths.
        # clist, paths = self.TA.constraint_lists_for_all_paths(self.location)

        # Identifiers for constraints over the whole TA/
        self.clist = self.TA.constraint_keys_for_ta()

        assert len(self.clist) > 0

        self.dimension = len(self.clist)
        self.explorer = Explorer(self.dimension)
        self.msres = []
        self.mgs = []
        self.traces = []
        self.verbosity = 0
        self.task = "mmsr"


        #statistics related data-structures and functionality
        self.stats = {}
        self.stats["checks"] = 0
        self.stats["checks_insufficient"] = 0
        self.stats["checks_sufficient"] = 0
        self.stats["checks_insufficient_time"] = 0
        self.stats["checks_sufficient_time"] = 0
        self.stats["shrinks"] = 0
        self.stats["shrinks_time"] = 0
        self.stats["grows"] = 0
        self.stats["grows_time"] = 0
        self.stats["timeout"] = False
        self.stats["shrinksPaths"] = 0
        self.stats["shrinksPaths_time"] = 0

        self.timelimit = 1000000 #time limit for the MSR enumeration
        self.start_time = time.clock()
    def complement(self, N):
        return [i for i in range(self.dimension) if i not in N]

    def corePathAnalysis(self, N, trace):
        start_time = time.clock()
        toCheck = N[:]
        for c in toCheck:
            if self.explorer.is_critical(c, N): continue # c is minable conflicting for N
            N.remove(c)
            if not path_analysis.is_realizable(self.TA, trace, [self.clist[d] for d in N]):
                N.append(c)
        self.stats["shrinksPaths"] += 1
        self.stats["shrinksPaths_time"] += time.clock() - start_time
        return N


    # returs true iff N is a sufficient reduction
    def check(self, N, pathAnalysis = True):
        relax_set = [self.clist[c] for c in N]
        new_templates = self.TA.generate_relaxed_templates(relax_set)
        # Set the TA to template in self.model, store it to file named new_model
        new_model = ta_helper.set_templates_and_save(self.model_file, self.model, new_templates)
        # Now finds constraints from relaxation set that are needed for the trace
        res, used_constraints, trace = ta_helper.verify_reachability(new_model, self.query_file, self.TA,
                                                                     relax_set, self.template_name)
        core = []
        if res == 1:
            for c in used_constraints:
                assert c in self.clist
                core.append(self.clist.index(c))
            N = core
            if self.usePathAnalysis and pathAnalysis:
                N = self.corePathAnalysis(N, trace)
        else: core = N
        return res == 1, core, trace

    # a wrapper for the method check(self, N)
    # returs true iff N is a sufficient reduction
    def is_sufficient(self, N, pathAnalysis = True):        
        start_time = time.clock()
        self.stats["checks"] += 1
        sufficient, core, trace = self.check(N, pathAnalysis)
        if sufficient: 
            self.stats["checks_sufficient"] += 1
            self.stats["checks_sufficient_time"] += time.clock() - start_time
        else: 
            self.stats["checks_insufficient"] += 1
            self.stats["checks_insufficient_time"] += time.clock() - start_time
        
        return sufficient, core, trace
   
    # takes an unexplored u-seed N and returns an unexplored MSR N' of N such that N' \subseteq N
    def shrink(self, N, trace_for_N):
        start_time = time.clock()
        toCheck = N[:]
        for c in toCheck:
            if (c not in N) or self.explorer.is_critical(c, N): continue # c is minable conflicting for N
            copy = N[:]
            copy.remove(c)
            sufficient, core, trace = self.is_sufficient(copy)
            if sufficient:
                N = core
                trace_for_N = trace
        self.stats["shrinks"] += 1
        self.stats["shrinks_time"] += (time.clock() - start_time)
        return N, trace_for_N
    
    # takes an unexplored u-seed N and returns an unexplored MSR N' of N such that N' \subseteq N
    def shrinkShadow(self, N, trace_for_N):
        start_time = time.clock()
        toCheck = N[:]
        for c in toCheck:
            if (c not in N) or self.explorer.is_critical(c, N): continue # c is minable conflicting for N
            copy = N[:]
            copy.remove(c)
            sufficient, core, trace = self.is_sufficient(copy)
            if sufficient:
                N = core
                trace_for_N = trace
            else:
                self.explorer.shadow_block_down(copy)
        self.stats["shrinks"] += 1
        self.stats["shrinks_time"] += (time.clock() - start_time)
        return N, trace_for_N

    # takes an insufficient reduction N and returns a maximal insufficient reduction N' \supseteq N
    def grow(self, N):
        start_time = time.clock()
        toCheck = self.complement(N)
        for c in toCheck:
            if self.explorer.is_conflicting(c, N): continue # c is minable conflicting for N
            copy = N[:]
            copy.append(c)
            sufficient, core, trace = self.is_sufficient(copy)
            if not sufficient:
                N = copy
        self.stats["grows"] += 1
        self.stats["grows_time"] += time.clock() - start_time
        return N

    # takes an insufficient reduction N and returns a maximal insufficient reduction N' \supseteq N
    def growShadow(self, N):
        start_time = time.clock()
        toCheck = self.complement(N)
        for c in toCheck:
            if self.explorer.is_conflicting(c, N): continue # c is minable conflicting for N
            copy = N[:]
            copy.append(c)
            sufficient, core, trace = self.is_sufficient(copy)
            if not sufficient:
                N = copy
            else:
                self.explorer.shadow_block_up(core[:], trace)
        self.stats["grows"] += 1
        self.stats["grows_time"] += time.clock() - start_time
        return N

    def markMSR(self, N, trace):
        print "Found MSR: {}".format([self.clist[c] for c in N])
        self.explorer.block_up(N)
        if self.task not in ["amsramg", "growshrink", "shrinkgrow", "marco", "sba", "eba"]: self.explorer.block_down(N)
        self.msres.append(N)
        self.traces.append(trace)

    def markCoMG(self, N):
        print "Found MG: {}".format([self.clist[c] for c in self.complement(N)])
        if self.task not in ["amsramg", "growshrink", "shrinkgrow", "marco", "sba", "eba"]: self.explorer.block_up(N)
        self.explorer.block_down(N)
        self.mgs.append(self.complement(N))

    def run(self):
        t = self.task
        if t in ["mmsr", "amsr"]:
            self.runMMSR()
        elif t in ["mmg", "amg"]:
            self.runMMG()
        elif t == "msr":
            pass
        elif t == "mg":
            pass
        elif t in ["sba", "maxsba"]:
            self.SBA(allMGs = t == "sba")
        elif t in ["pasba", "maxpasba"]:
            self.SBAcorePath(t == "pasba")
        elif t in ["eba","mineba"]:
            self.EBA(allMSRs = t == "eba")
        elif t == "marco":
            self.marco()
        else:
            assert False
        print "MSRs:", len(self.msres)
        print "MGs:", len(self.mgs)
        print "checks:", self.stats["checks"]

        uMSR = set()
        iMSR = set(self.complement([]))
        for m in self.msres:
            uMSR.update(m)
            iMSR.intersection_update(m)
        print "union of MSRs:", len(uMSR)
        print "intersection of MSRs:", len(iMSR)
        
        uMG = set()
        iMG = set(self.complement([]))
        for m in self.mgs:
            uMG.update(m)
            iMG.intersection_update(m)
        print "union of MGs:", len(uMG)
        print "intersection of MGs:", len(iMG)

        #minimum MSRs
        MMSRcard = min([len(M) for M in self.msres]) #minimum MSR cardinality
        AMMSR = [M for M in self.msres if len(M) == MMSRcard]
        print "minimum MSR cardinality:", MMSRcard
        print "number of MMSRs:", len(AMMSR)
        unionOfAMMSR = set(sum(AMMSR, []))
        actualConstraints = [self.clist[c] for c in unionOfAMMSR]
        print "union of AMMSRs:", actualConstraints

    def EBA(self, allMSRs = True):
        start_time = time.clock()
        seed = self.explorer.get_unex()
        current_max = -1
        while seed is not None:
            seed = self.explorer.minimize(seed[:])
            sufficient, trace = None, None
            sSufficient, sTrace = self.explorer.is_shadow_sufficient(seed)
            if sSufficient:
                sufficient, trace = True, sTrace
            else:
                sufficient, _, trace = self.is_sufficient(seed)
            if sufficient:
                self.markMSR(seed[:], trace)
                if not allMSRs:
                    current_max = len(seed)
            else:
                coMG = self.growShadow(seed)
                self.markCoMG(coMG)
            seed = self.explorer.get_unex(maxCard = current_max)
            if time.clock() - start_time > self.timelimit:
                self.stats["timeout"] = True
                print("User-defined timelimit of {} seconds exceeded. Aborting MMG extraction.".format(self.timelimit))
                break
    
    def TBA(self, N, trace, msr):        
        exp = Explorer(self.dimension)
        exp.block_up(msr)
        seed = exp.get_unex_subset(N)
        while seed is not None:
            if self.explorer.is_shadow_insufficient(seed):
                exp.block_down(seed)
            elif path_analysis.is_realizable(self.TA, trace, [self.clist[d] for d in seed]):
                msr, trace = self.shrinkShadow(N, trace)
                self.markMSR(msr, trace)
            else:
                exp.block_down(seed)
            seed = exp.get_unex_subset(N)


    def SBAcorePath(self, allMGs = True):
        start_time = time.clock()
        seed = self.explorer.get_unex()
        current_min = -1
        while seed is not None:
            seed = self.explorer.maximize(seed[:])
            sufficient, core, trace = None, None, None
            sInsufficient = self.explorer.is_shadow_insufficient(seed)
            if sInsufficient:
                sufficient = False
            else:
                sufficient, core, trace = self.is_sufficient(seed, pathAnalysis = False)
            if sufficient:
                N = self.corePathAnalysis(core, trace)
                msr, trace = self.shrinkShadow(N, trace)
                self.markMSR(msr, trace)
                self.TBA(N, trace, msr)
            else:
                self.markCoMG(seed)
                if not allMGs:
                    current_min = len(seed)
            seed = self.explorer.get_unex(minCard = current_min)
            if time.clock() - start_time > self.timelimit:
                self.stats["timeout"] = True
                print("User-defined timelimit of {} seconds exceeded. Aborting MMG extraction.".format(self.timelimit))
                break
        

    def SBA(self, allMGs = True):
        start_time = time.clock()
        seed = self.explorer.get_unex()
        current_min = -1
        while seed is not None:
            seed = self.explorer.maximize(seed[:])
            sufficient, core, trace = None, None, None
            sInsufficient = self.explorer.is_shadow_insufficient(seed)
            if sInsufficient:
                sufficient = False
            else:
                sufficient, core, trace = self.is_sufficient(seed)
            if sufficient:
                msr, trace = self.shrinkShadow(core, trace)
                self.markMSR(msr, trace)
            else:
                self.markCoMG(seed)
                if not allMGs:
                    current_min = len(seed)
            seed = self.explorer.get_unex(minCard = current_min)
            if time.clock() - start_time > self.timelimit:
                self.stats["timeout"] = True
                print("User-defined timelimit of {} seconds exceeded. Aborting MMG extraction.".format(self.timelimit))
                break
    
    def marco(self):
        start_time = time.clock()
        seed = self.explorer.get_unex()
        while seed is not None:
            seed = self.explorer.maximize(seed[:])
            sufficient, core, trace = self.is_sufficient(seed)
            if not sufficient:
                self.markCoMG(seed)
            else:
                msr, trace = self.shrink(core, trace)
                self.markMSR(msr, trace)
            seed = self.explorer.get_unex()
            if time.clock() - start_time > self.timelimit:
                self.stats["timeout"] = True
                print("User-defined timelimit of {} seconds exceeded. Aborting MMG extraction.".format(self.timelimit))
                break
        print "checks:", self.stats["checks"]
    
    #finds a minimum minimal guarantee
    def minimumMG(self, allMGs = False):
        start_time = time.clock()
        seed = self.explorer.get_unex()
        current_max = -1
        while seed is not None:
            seed = self.explorer.minimize(seed[:], minCard = current_max + 1)
            sufficient, core, trace = self.is_sufficient(seed)
            if not sufficient:
                coMG = self.grow(seed)
                self.markCoMG(coMG)
                if not allMGs:
                    assert (current_max == -1) or current_max < len(coMG)
                    current_max = len(coMG)
            else:
                seed,_ = self.shrink(seed, None)
                self.explorer.block_up(seed)
            seed = self.explorer.get_unex(minCard = current_max + 1)
            if time.clock() - start_time > self.timelimit:
                self.stats["timeout"] = True
                print("User-defined timelimit of {} seconds exceeded. Aborting MMG extraction.".format(self.timelimit))
                break
        
    def runMMG(self):
        self.minimumMG(allMGs = self.task == "amg")
        #print statistics
        print "MG computation terminated"
        mgs, constraints = self.get_MGs()
        print "Elapsed time in seconds:", (time.clock() - self.start_time)
        print "identified MGs:", mgs
        print "corresponding constraints:", constraints

        # Minimal mgs:
        mgs_size = [len(m) for m in mgs]
        min_size = min(mgs_size)
        min_mgs_indexes = [i for i in range(len(mgs_size)) if mgs_size[i] == min_size]
        print "Minimum MGs:"
        for i in min_mgs_indexes:
            print constraints[i]

        if self.args.run_imitator_on_mg:
            #                       imitator creation                   #
            mg = mgs[min_mgs_indexes[0]]
            relax_list = [c for c in self.clist]

            for c in mg:                # create the list that will be removed from the model
                relax_list.remove(c)

            # this will be used to create the imi file
            new_templates, parameter_count = self.TA.generate_relaxed_and_parametrized_templates(relax_list, mg)
            declaraion_of_the_system = self.model.declaration
            process_template_pair_of_the_system = self.model.system
            # print set(constraints[0])
            imi_name, imiporp_name = xml_to_imi.create_imitator_on_mg(new_templates,
                                                                      declaraion_of_the_system,
                                                                      process_template_pair_of_the_system,
                                                                      self.model_file,
                                                                      self.query_file,
                                                                      parameter_count)
            output_file = self.query_file.split(".q")[0]
            command = "imitator " + imi_name + " " + imiporp_name + " -output-prefix " + output_file + " -verbose mute"
            print "running " + command
            os.system(command)
            parameter_vals, total_sum = xml_to_imi.find_maximum_parameter_values(output_file + ".res", parameter_count)
            print "Total sum for maximum parameter valuations:", total_sum

    def runMMSR(self):
        self.minimumMSR(allMSRs = self.task == "amsr")
        #print statistics
        print "MSR computation terminated"
        msres, constraints, traces = self.get_MSRes()
        print "Elapsed time in seconds:", (time.clock() - self.start_time)
        print "identified MSRes:", msres
        print "corresponding constraints:", constraints

        # Minimal msres:
        msres_size = [len(m) for m in msres]
        min_size = min(msres_size)
        min_msres_indexes = [i for i in range(len(msres_size)) if msres_size[i] == min_size]
        print "Minimum MSRes:"
        for i in min_msres_indexes:
            delays, parameters = path_analysis.find_parameters(self.TA,traces[i],msres[i])
            print "{} delays:{} parameters{}".format(constraints[i], delays, parameters)
        print "Elapsed time in seconds after LP:", (time.clock() - self.start_time)

    #finds a minimum minimal sufficient reduction
    def minimumMSR(self, allMSRs = False):
        start_time = time.clock()
        seed = self.explorer.get_unex()
        current_min = -1
        while seed is not None:
            seed = self.explorer.maximize(seed[:], maxCard = current_min - 1)
            sufficient, core, trace = self.is_sufficient(seed)
            if sufficient:
                msr, trace = self.shrink(core, trace)
                self.markMSR(msr, trace)
                if not allMSRs:
                    assert (current_min == -1) or current_min > len(msr)
                    current_min = len(msr)
            else:
                seed = self.grow(seed)
                self.explorer.block_down(seed)
            seed = self.explorer.get_unex(maxCard = current_min - 1)
            if time.clock() - start_time > self.timelimit:
                self.stats["timeout"] = True
                print("User-defined timelimit of {} seconds exceeded. Aborting MMSR extraction.".format(self.timelimit))
                break

    def get_MSRes(self):
        msres = []
        constraints = []
        for m in self.msres:
            msres.append([self.clist[c] for c in m])
            constraints.append([self.TA.constraint_registry[c] for c in msres[-1]])
        return msres, constraints, self.traces

    def get_MGs(self):
        mgs = []
        constraints = []
        for m in self.mgs:
            mgs.append([self.clist[c] for c in m])
            constraints.append([self.TA.constraint_registry[c] for c in mgs[-1]])
        return mgs, constraints

    def print_statistics(self):
        print ""
        print "=== detailed statistics ===" 
        print "Identified MSRs:", len(self.msres)
        print "Minimum MSRs:", len([m for m in self.msres if len(m) == min([len(n) for n in self.msres])]) 
        print "Identified MGs:", len(self.mgs)
        print "Minimum MGs:", len([m for m in self.mgs if len(m) == min([len(n) for n in self.mgs])]) 
        print "Performed reachability checks:", self.stats["checks"]
        print "Checks with result 'reachable':", self.stats["checks_sufficient"] 
        print "Checks with result 'unreachable':", self.stats["checks_insufficient"] 
        print "Total time spent by reachability checks:", self.stats["checks_insufficient_time"] + self.stats["checks_sufficient_time"]
        print "Average time of 'reachable' check:", self.stats["checks_sufficient_time"]/ self.stats["checks_sufficient"]
        print "Average time of 'unreachable' check:", self.stats["checks_insufficient_time"]/ self.stats["checks_insufficient"]
        print "Shrinks:", self.stats["shrinks"]  
        print "Total time spent by shrinks:", self.stats["shrinks_time"]  
        print "Path analyses:", self.stats["shrinksPaths"]  
        print "Total time spent by path analyses:", self.stats["shrinksPaths_time"]  
        print "Grows:", self.stats["grows"]
        print "Total time spent by grows:", self.stats["grows_time"]

        print "==========================="
        print ""

if __name__ == '__main__':
    
    #define command line arguments
    parser = argparse.ArgumentParser("TAMUS - a tool for relaxing reachability properties in Time Automatas based on Minimal Sufficinet Reductions (MRS) and linear programming.")
    parser.add_argument("model_file", help = "A path to a model file")
    parser.add_argument("query_file", help = "A path to a query file")
    parser.add_argument("template_name", help="Name of template")
    parser.add_argument("--verbose", "-v", action="count", help = "Use the flag to increase the verbosity of the outputs. The flag can be used repeatedly.")    
    parser.add_argument("--msr-timelimit", type=int, help = "Sets up timelimit for MSR enumeration. Note that the computation is not terminated exactly after the timelimit, but once the last identified MSR exceeds the timelimit. We recommend you to use UNIX timeout when using our tool, if you want to timeout the whole computation. ")
    parser.add_argument("--task", choices=["pasba", "maxpasba", "msr", "mmsr", "mg", "mmg", "amsr", "amg", "amsramg", "eba", "sba", "marco", "maxsba", "mineba"], help = "Choose the computation taks: msr - an MSR, mmsr - a minimum MSR, mg - an MG, mmg - a minimum MG, amsr - all MSRs, amg - all MGs, amsramg - all MSRs and MGs.", default = "mmsr")
    parser.add_argument("--run_imitator_on_mg", action='store_true', help="After fnding minimal guarantee, runs imitator on it. This value does not have effect if any task other than mmg is selected.")
    parser.add_argument("--path-analysis", action='store_true', help = "Use path analysis to further shrink reduction cores.")
    parser.add_argument("--multiple-path-cores", action='store_true', help = "Extract multiple MUSes from a single witness path.")
    args = parser.parse_args()

    #run the computation
    model = args.model_file
    query_file = args.query_file
    template_name = args.template_name
    t = Tamus(model, query_file, template_name, args)
    t.timelimit = args.msr_timelimit if args.msr_timelimit != None else 1000000 
    t.verbosity = args.verbose if args.verbose != None else 0
    t.task = args.task
    t.usePathAnalysis = args.path_analysis
    t.useMultiplePathCores = args.multiple_path_cores
    print "Model: ", model, ", query: ", query_file
    print "dimension:", t.dimension
    print "is the target location reachable?", t.is_sufficient([])[0]
    print ""
    t.run()


    if t.verbosity > 0:
        t.print_statistics()
