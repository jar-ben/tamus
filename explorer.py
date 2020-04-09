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

    # checks whether is c avaiable for N, i.e., whether is N \cup {c} unexplored
    # in other words, checks whether c is minable conflicting for N
    def is_available(self, c, N):
        return self.is_unexplored(N + [c])

    # checks if N is unexplored
    def is_unexplored(self, N):
        assumptions = [self.vars[c] for c in N] + [Not(self.vars[c]) for c in self.complement(N)]
        return (self.s.check(assumptions) == sat)
