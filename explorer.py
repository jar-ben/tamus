from z3 import *

class Explorer:
    def __init__(self, dimension):
        self.dimension = dimension
        self.vars = []
        for i in range(dimension):
            self.vars.append(Bool('x' + str(i)))
        self.s = Solver()
        self.only_minimum = False

    def complement(self, N):
        return [i for i in range(self.dimension) if i not in N]

    def block_up(self, N):
        block = [Not(self.vars[n]) for n in N ]
        if self.only_minimum:
            self.s.add(PbLe([(x,1) for x in self.vars], len(N) - 1) )
        else:
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

    # maximize a given unexplored subset (seed)
    def maximize(self, seed):
        candidates = self.complement(seed)
        while len(candidates) > 0:
            c = candidates[-1]
            candidates = candidates[:-1]
            if not self.is_conflicting(c, seed):
                seed.append(c)
        return seed

    # minimize a given unexplored subset (seed)
    def minimize(self, seed):
        candidates = seed[:]
        while len(candidates) > 0:
            c = candidates[-1]
            candidates = candidates[:-1]
            if not self.is_critical(c, seed):
                seed.remove(c)
        return seed

    # checks whether c is minable critical for N, i.e., whether N - {c} is unexplored
    def is_critical(self, c, N):
        assert c in N
        Nc = N[:]
        Nc.remove(c)
        return not self.is_unexplored(Nc)

    # checks whether c is minable conflicting for N, i.e., whether N \cup {c} is unexplored
    def is_conflicting(self, c, N):
        return not self.is_unexplored(N + [c])

    # checks if N is unexplored
    def is_unexplored(self, N):
        assumptions = [self.vars[c] for c in N] + [Not(self.vars[c]) for c in self.complement(N)]
        return (self.s.check(assumptions) == sat)
