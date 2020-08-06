import sys
import time
import argparse

from explorer import Explorer
from uppaalHelpers import ta_helper
from uppaalHelpers import timed_automata


class Tamus:
    def __init__(self, model_file, query_file):
        self.model_file = model_file # file name
        self.query_file = query_file # file name
        # self.model stores the network of ta from model_file
        # template is the TA of interest for which the constraint analysis is performed.
        # template in self.model is modified during the computation. A modified TA is set for each
        # verification step (verifyta is called).
        # self.location is the target location
        self.model, template, self.location = ta_helper.get_template(self.model_file,self.query_file)

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
        self.verbosity = 0
        self.use_unsat_cores = True
        #algorithm for the MSR enumeration
        self.algorithm = "marco"

        self.shrinkingQueue = [] #for the algorithm Grow-Shrink

        #statistics related data-structures and functionality
        self.stats = {}
        self.stats["checks"] = 0
        self.stats["checks_insufficient"] = 0
        self.stats["checks_sufficient"] = 0
        self.stats["checks_insufficient_time"] = 0
        self.stats["checks_sufficient_time"] = 0
        self.stats["shrinks"] = 0
        self.stats["shrinks_time"] = 0

    def complement(self, N):
        return [i for i in range(self.dimension) if i not in N]

    # returs true iff N is a sufficient reduction
    def check(self, N):
        relax_set = [self.clist[c] for c in N]
        new_template = self.TA.generate_relaxed_template(relax_set)
        # Set the TA to template in self.model, store it to file named new_model
        new_model = ta_helper.set_template_and_save(self.model_file, self.model, new_template)
        # Now finds constraints from relaxation set that are needed for the trace
        res, used_constraints = ta_helper.verify_reachability(new_model, self.query_file, self.TA, relax_set)
        core = []
        if res == 1 and self.use_unsat_cores:
            for c in used_constraints:
                assert c in self.clist
                core.append(self.clist.index(c))
            N = core
        else: core = N
        return res == 1, core

    # a wrapper for the method check(self, N)
    # returs true iff N is a sufficient reduction
    def is_sufficient(self, N):        
        start_time = time.clock()
        self.stats["checks"] += 1
        sufficient, core = self.check(N)
        if sufficient: 
            self.stats["checks_sufficient"] += 1
            self.stats["checks_sufficient_time"] += time.clock() - start_time
        else: 
            self.stats["checks_insufficient"] += 1
            self.stats["checks_insufficient_time"] += time.clock() - start_time
        
        return sufficient, core
   
    # takes an unexplored u-seed N and returns an unexplored MSR N' of N such that N' \subseteq N
    def shrink(self, N):
        start_time = time.clock()
        toCheck = N[:]
        for c in toCheck:
            if (c not in N) or self.explorer.is_critical(c, N): continue # c is minable conflicting for N
            copy = N[:]
            copy.remove(c)
            sufficient, core = self.is_sufficient(copy)
            if sufficient:
                N = core
            else:
                self.explorer.block_down(copy)
        self.stats["shrinks"] += 1
        self.stats["shrinks_time"] += time.clock() - start_time
        return N

    def GSShrink(self, N):
        M = []

    def markMSR(self, N):
        print "Found MSR: {}".format([self.clist[c] for c in N]) 
        self.explorer.block_up(N)
        self.explorer.block_down(N)
        self.msres.append(N)

    def run(self):
        if self.algorithm == "tome":
            self.enumerate_tome()
        elif self.algorithm == "grow-shrink":
            pass
        else:
            self.enumerate_marco()

    # builds an unexplored chain between bot and top and finds the local MSR and the local MSS of the chain
    def tome_local_search(self, bot, top):
        diff = list(set(top) - set(bot))
        low = 0
        high = len(diff) - 1
        while high - low > 1:
            mid = (low + high) // 2
            seed = bot + [diff[i] for i in range(mid)]
            if not self.is_sufficient(seed)[0]:
                low = mid
            else:
                high = mid
        assert high - low == 1
        localMSS = bot + [diff[i] for i in range(low)]
        localMSR = bot + [diff[i] for i in range(high)]
        return localMSR, localMSS

    # the main function of the TOME MSR enumeration algorithm
    def enumerate_tome(self):
        seed = self.explorer.get_unex()
        while seed is not None:
            top = self.explorer.maximize(seed[:])
            bot = self.explorer.minimize(seed[:])
            if self.is_sufficient(bot)[0]:
                self.markMSR(bot)
            elif not self.is_sufficient(top)[0]:
                self.explorer.block_down(top)
            else:
                localMSR, localMSS = self.tome_local_search(bot, top)
                msr = self.shrink(localMSR)
                self.markMSR(msr)
                self.explorer.block_down(localMSS)
            seed = self.explorer.get_unex()

    # the main function of the GROW-SHRINK MSR enumeration algorithm
    def enumerate_grow_shrink(self):
        pass

    # the main function of the MARCO MSR enumeration algorithm
    def enumerate_marco(self):
        seed = self.explorer.get_unex()
        while seed is not None:
            seed = self.explorer.maximize(seed[:])
            sufficient, core = self.is_sufficient(seed)
            if sufficient:
                msr = self.shrink(core)
                self.markMSR(msr)
            else:
                self.explorer.block_down(seed)
            seed = self.explorer.get_unex()

    def get_MSRes(self):
        msres = []
        constraints = []
        for m in self.msres:
            msres.append([self.clist[c] for c in m])
            constraints.append([self.TA.constraint_registry[c] for c in msres[-1]])
        return msres, constraints

    def print_statistics(self):
        print ""
        print "=== detailed statistics ===" 
        print "Identified MSRs:", len(self.msres)
        print "Minimal MSRs:", len([m for m in self.msres if len(m) == min([len(n) for n in self.msres])]) 
        print "Performed reachability checks:", self.stats["checks"]
        print "Checks with result 'reachable':", self.stats["checks_sufficient"] 
        print "Checks with result 'unreachable':", self.stats["checks_insufficient"] 
        print "Total time spent by reachability checks:", self.stats["checks_insufficient_time"] + self.stats["checks_sufficient_time"]
        print "Average time of 'reachable' check:", self.stats["checks_sufficient_time"]/ self.stats["checks_sufficient"]
        print "Average time of 'unreachable' check:", self.stats["checks_insufficient_time"]/ self.stats["checks_insufficient"]
        print "Shrinks:", self.stats["shrinks"]  
        print "Total time spent by shrinks:", self.stats["shrinks_time"]  
        print "==========================="
        print ""

if __name__ == '__main__':
    start_time = time.clock()
    
    #define command line arguments
    parser = argparse.ArgumentParser("TAMUS - a tool for relaxing reachability properties in Time Automatas with a help of Minimal Uninsufficientisfiable Subsets")
    parser.add_argument("model_file", help = "A path to a model file")
    parser.add_argument("query_file", help = "A path to a query file")
    parser.add_argument("--algorithm", "-a", help = "A MSR enumeration algorithm to be used", choices = ["marco", "tome", "grow-shrink"], default = "marco")
    parser.add_argument("--verbose", "-v", action="count", help = "Use the flag to increase the verbosity of the outputs. The flag can be used repeatedly.")    
    parser.add_argument("--no-unsat-cores", "-n", action="count", help = "Use the flag to disable usage of unsat cores.")    
    parser.add_argument("--only-minimum", "-m", action="count", help = "Use the flag to guide the search to the minimum MRS (identifies only some MRS, including the minimum one).")    
    #parse the command line arguments
    args = parser.parse_args()

    #run the computation
    model = args.model_file
    query_file = args.query_file    
    t = Tamus(model, query_file)
    t.algorithm = args.algorithm
    t.verbosity = args.verbose if args.verbose != None else 0
    t.use_unsat_cores = args.no_unsat_cores == None
    t.explorer.only_minimum = args.only_minimum != None
    print "Model: ", model, ", query: ", query_file
    print "dimension:", t.dimension
    print "is the target location reachable?", t.is_sufficient([i for i in range(t.dimension)])[0]
    print "running the MSR enumeration algorithm " + t.algorithm
    print ""
    t.run()    

    #print statistics
    print "all MSRes were identified"
    msres, constraints = t.get_MSRes()
    print "Elapsed time in seconds:", (time.clock() - start_time)
    print "identified MSRes:", msres
    print "corresponding constraints:", constraints

    # Minimal msres:
    msres_size = [len(m) for m in msres]
    min_size = min(msres_size)
    min_msres_indexes = [i for i in range(len(msres_size)) if msres_size[i] == min_size]
    print "Minimum MSRes:"
    for i in min_msres_indexes:
        print constraints[i]

    if t.verbosity > 0:
        t.print_statistics()
