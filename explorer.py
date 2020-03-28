from z3 import *

class Explorer:
    def __init__(self, dimension):
        self.dimension = dimension
        self.vars = []
        for i in range(dimension):
            self.vars.append(Bool('x' + str(i)))
        self.s = Solver()

    def complement(self, N):
        return [i for i in range(self.dimension) if i not in N]

    def block_up(self, N):
        block = [Not(self.vars[n]) for n in N ]
        self.s.add(Or(block))

    def block_down(self, N):
        block = [self.vars[n] for n in self.complement(N) ]
        self.s.add(Or(block))

    def get_unex(self):
        check = self.s.check()
        if check != sat:
            return None
        else:
            seed = []
            m = self.s.model()
            for x in m:
                if is_true(m[x]):
                    seed.append(int(str(x)[1:]))
        return seed

