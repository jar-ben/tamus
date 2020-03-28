import sys
import os.path

from explorer import Explorer
sys.path.insert(0, "./uppaalHelpers")
import pyuppaal
import ta_helper
import timed_automata

class Tamus:
    def __init__(self, model_file, query_file):
        self.model = model_file
        self.query = query_file
        template, location = ta_helper.get_template(self.model,self.query)
        TA = timed_automata.TimedAutomata()
        TA.initialize_from_template(template)
        clist = TA.constraint_lists_for_all_paths(location)
        assert len(clist) > 0
        self.clist = clist[0]
        self.dimension = len(clist[0])
        self.exp = Explorer(self.dimension)
        self.mcses = []

    def complement(self, N):
        return [i for i in range(self.dimension) if i not in N]

    def check(self, N):
        timed_automata.next_id = 0 #this is very ugly, the next_id should not be handled as a global variable
        template, location = ta_helper.get_template(self.model, self.query)
        TA = timed_automata.TimedAutomata()
        TA.initialize_from_template(template)
        relax_set = [self.clist[c] for c in self.complement(N)]
        
        new_template = TA.generate_relaxed_template(relax_set)
        new_model = ta_helper.set_template_and_save(self.model, new_template)
        res = ta_helper.verify_reachability(new_model, self.query)
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
    

    t = Tamus(model, query_file)
    print "dimension:", t.dimension
    print "is the input satisfiable?", t.is_valid([i for i in range(t.dimension)])
    t.run()    
    mcses = t.get_MCSes()
    print(mcses)
    
