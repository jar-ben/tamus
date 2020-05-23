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
        # self.TA.print_registry(model_file + "_registry")
        # clist is a list of lists. Each entry (thus list) represents the list of constraints along a path.
        # paths is the list of corresponding paths.
        clist, paths = self.TA.constraint_lists_for_all_paths(self.location)
        assert len(clist) > 0
        # Construct a path TA, it is for efficiency purposes. It consists of a single path.
        self.pathTA = timed_automata.TimedAutomata()
        self.pathTA.initialize_path_TA_from_template(template, paths[0])
        clist, paths = self.pathTA.constraint_lists_for_all_paths(self.location)
        # For now, Tamus performs constraint analysis over a single path. (TODO)
        self.clist = clist[0]
        self.dimension = len(clist[0])
        self.explorer = Explorer(self.dimension)
        self.mcses = []
        self.verbosity = 0
        #algorithm for the MCS enumeration
        self.algorithm = "marco"


        #statistics related data-structures and functionality
        self.stats = {}
        self.stats["checks"] = 0
        self.stats["checks_sat"] = 0
        self.stats["checks_unsat"] = 0
        self.stats["checks_sat_time"] = 0
        self.stats["checks_unsat_time"] = 0
        self.stats["grows"] = 0
        self.stats["grows_time"] = 0

    def complement(self, N):
        return [i for i in range(self.dimension) if i not in N]

    def check(self, N):
        relax_set = [self.clist[c] for c in self.complement(N)]
        # new_template = self.TA.generate_relaxed_template(relax_set)
        new_template = self.pathTA.generate_relaxed_template(relax_set)
        # Set the TA to template in self.model, store it to file named new_model
        new_model = ta_helper.set_template_and_save(self.model_file, self.model, new_template)
        res = ta_helper.verify_reachability(new_model, self.query_file)
        return res == 1

    def is_sat(self, N):        
        start_time = time.clock()
        self.stats["checks"] += 1
        sat = self.check(N)
        if sat: 
            self.stats["checks_sat"] += 1
            self.stats["checks_sat_time"] += time.clock() - start_time
        else: 
            self.stats["checks_unsat"] += 1
            self.stats["checks_unsat_time"] += time.clock() - start_time
        
        return sat
   
    # takes an unexplored s-seed N and returns an unexplored MSS N' of N such that N' \supseteq N
    def grow(self, N):
        start_time = time.clock()
        for c in self.complement(N):
            if self.explorer.is_conflicting(c, N): continue # c is minable conflicting for N
            copy = N[:] + [c]
            if self.is_sat(copy):
                N.append(c)
            else:
                self.explorer.block_up(copy)
        self.stats["grows"] += 1
        self.stats["grows_time"] += time.clock() - start_time
        return N

    def markMSS(self, N):
        print "Found MCS: {}".format([self.clist[c] for c in self.complement(N)]) 
        self.explorer.block_down(N)
        self.explorer.block_up(N)
        self.mcses.append(self.complement(N))

    def run(self):
        if self.algorithm == "tome":
            self.enumerate_tome()
        elif self.algorithm == "grow-shrink":
            pass
        else:
            self.enumerate_marco()

    # builds an unexplored chain between bot and top and finds the local MUS and the local MSS of the chain
    def tome_local_search(self, bot, top):
        diff = list(set(top) - set(bot))
        low = 0
        high = len(diff) - 1
        while high - low > 1:
            mid = (low + high) // 2
            seed = bot + [diff[i] for i in range(mid)]
            if self.is_sat(seed):
                low = mid
            else:
                high = mid
        assert high - low == 1
        localMSS = bot + [diff[i] for i in range(low)]
        localMUS = bot + [diff[i] for i in range(high)]
        return localMUS, localMSS

    # the main function of the TOME MCS enumeration algorithm
    def enumerate_tome(self):
        seed = self.explorer.get_unex()
        while seed is not None:
            top = self.explorer.maximize(seed[:])
            bot = self.explorer.minimize(seed[:])
            if self.is_sat(top):
                self.markMSS(top)
            elif not self.is_sat(bot):
                self.explorer.block_up(seed)
            else:
                localMUS, localMSS = self.tome_local_search(bot, top)
                mss = self.grow(localMSS)
                self.markMSS(mss)
                self.explorer.block_up(localMUS)
            seed = self.explorer.get_unex()

    # the main function of the GROW-SHRINK MCS enumeration algorithm
    def enumerate_grow_shrink(self):
        pass

    # the main function of the MARCO MCS enumeration algorithm
    def enumerate_marco(self):
        seed = self.explorer.get_unex()
        while seed is not None:
            if self.is_sat(seed):
                mss = self.grow(seed[:])
                self.markMSS(mss)
            else:
                self.explorer.block_up(seed)
            seed = self.explorer.get_unex()

    def get_MCSes(self):
        mcses = []
        constraints = []
        for m in self.mcses:
            mcses.append([self.clist[c] for c in m])
            constraints.append([self.pathTA.constraint_registry[c] for c in mcses[-1]])
        return mcses, constraints

    def print_statistics(self):
        print ""
        print "=== detailed statistics ===" 
        print "Performed reachability checks:", self.stats["checks"]
        print "Checks with result 'reachable':", self.stats["checks_sat"] 
        print "Checks with result 'unreachable':", self.stats["checks_unsat"] 
        print "Total time spent by reachability checks:", self.stats["checks_sat_time"] + self.stats["checks_unsat_time"]
        print "Average time of 'reachable' check:", self.stats["checks_sat_time"]/ self.stats["checks_sat"]
        print "Average time of 'unreachable' check:", self.stats["checks_unsat_time"]/ self.stats["checks_unsat"]
        print "Grows:", self.stats["grows"]  
        print "Total time spent by grows:", self.stats["grows_time"]  
        print "==========================="
        print ""

if __name__ == '__main__':
    start_time = time.clock()
    
    #define command line arguments
    parser = argparse.ArgumentParser("TAMUS - a tool for relaxing reachability properties in Time Automatas with a help of Minimal Unsatisfiable Subsets")
    parser.add_argument("model_file", help = "A path to a model file")
    parser.add_argument("query_file", help = "A path to a query file")
    parser.add_argument("--algorithm", "-a", help = "A MCS enumeration algorithm to be used", choices = ["marco", "tome", "grow-shrink"], default = "marco")
    parser.add_argument("--verbose", "-v", action="count", help = "Use the flag to increase the verbosity of the outputs. The flag can be used repeatedly.")    
    #parse the command line arguments
    args = parser.parse_args()

    #run the computation
    model = args.model_file
    query_file = args.query_file    
    t = Tamus(model, query_file)
    t.algorithm = args.algorithm
    t.verbosity = args.verbose if args.verbose != None else 0
    print "Model: ", model, ", query: ", query_file
    print "dimension:", t.dimension
    print "is the target location reachable?", t.is_sat([i for i in range(t.dimension)])
    print "running the MCS enumeration algorithm " + t.algorithm
    print ""
    t.run()    

    #print statistics
    print "all MCSes were identified"
    mcses, constraints = t.get_MCSes()
    print "identified MCSes:", mcses
    print "corresponding constraints:", constraints
    print "Elapsed time in seconds:", (time.clock() - start_time)
    if t.verbosity > 0:
        t.print_statistics()

    # 2- TODO construct partial automaton, i.e., along the PATH
