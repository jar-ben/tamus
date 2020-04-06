import sys
import time

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
        clist = self.TA.constraint_lists_for_all_paths(self.location)
        assert len(clist) > 0
        # For now, Tamus performs constraint analysis over a single path. (TODO)
        self.clist = clist[0]
        self.dimension = len(clist[0])
        self.exp = Explorer(self.dimension)
        self.mcses = []

    def complement(self, N):
        return [i for i in range(self.dimension) if i not in N]

    def check(self, N):
        relax_set = [self.clist[c] for c in self.complement(N)]
        new_template = self.TA.generate_relaxed_template(relax_set)
        # Set the TA to template in self.model, store it to file named new_model
        new_model = ta_helper.set_template_and_save(self.model_file, self.model, new_template)
        res = ta_helper.verify_reachability(new_model, self.query_file)
        return res == 1

    def is_valid(self, N):
        return self.check(N)
    
    def grow(self, N):
        for c in self.complement(N):
            copy = N[:] + [c]
            if self.is_valid(copy):
                N.append(c)
        return N

    def markMSS(self, N):
        print "Found MCS: {}".format([self.clist[c] for c in self.complement(N)]) 
        self.exp.block_down(N)
        self.mcses.append(self.complement(N))

    def run(self):
        seed = self.exp.get_unex()
        while seed is not None:
            if self.is_valid(seed):
                mss = self.grow(seed[:])
                self.markMSS(mss)
            else:
                self.exp.block_up(seed)
            seed = self.exp.get_unex()

    def get_MCSes(self):
        mcses = []
        for m in self.mcses:
            mcses.append([self.clist[c] for c in m])
        return mcses

if __name__ == '__main__':
    assert len(sys.argv) > 2
    model = sys.argv[1]
    query_file = sys.argv[2]

    start_time = time.clock()
    t = Tamus(model, query_file)
    print "Model: ", model, ", query: ", query_file
    print "dimension:", t.dimension
    print "is the input satisfiable?", t.is_valid([i for i in range(t.dimension)])
    t.run()    
    mcses = t.get_MCSes()
    print(mcses)
    print "Elapsed time", (time.clock() - start_time)
    # 2- TODO construct partial automaton, i.e., along the PATH
