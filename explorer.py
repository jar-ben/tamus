from z3 import *

class Explorer:
    def __init__(self, dimension):
        self.dimension = dimension
        self.vars = []
        for i in range(dimension):
            self.vars.append(Bool('x' + str(i)))
        self.s = Solver()
        self.blockUps = []
        self.blockDowns = []

    def complement(self, N):
        return [i for i in range(self.dimension) if i not in N]

    def block_up(self, N):
        self.blockUps.append(N[:])
        block = [Not(self.vars[n]) for n in N ]
        self.s.add(Or(block))

    def block_down(self, N):
        self.blockDowns.append(N[:])
        block = [self.vars[n] for n in self.complement(N) ]
        self.s.add(Or(block))

    def get_unex(self, minCard = -1, maxCard = -1):
        if min(minCard, maxCard) > 0:
            self.s.push()
        if minCard > 0:
            self.s.add(PbGe([(x,1) for x in self.vars], minCard))
        if maxCard > 0:
            self.s.add(PbLe([(x,1) for x in self.vars], maxCard))
        
        check = self.s.check()
        if check == sat:
            seed = []
            m = self.s.model()
            for x in m:
                if is_true(m[x]):
                    seed.append(int(str(x)[1:]))
            if min(minCard, maxCard) > 0:
                self.s.pop()
            return seed

        if min(minCard, maxCard) > 0:
            self.s.pop()
        return None

    # maximize a given unexplored subset (seed)
    def maximize(self, seed, minCard = -1, maxCard = -1):
        if min(minCard, maxCard) > 0:
            self.s.push()
        if minCard > 0:
            self.s.add(PbGe([(x,1) for x in self.vars], minCard))
        if maxCard > 0:
            self.s.add(PbLe([(x,1) for x in self.vars], maxCard))
        for c in self.complement(seed):
            if self.is_unexplored(seed + [c]):
                seed.append(c)
        if min(minCard, maxCard) > 0:
            self.s.pop()
        return seed

    # minimize a given unexplored subset (seed)
    def minimize(self, seed, minCard = -1, maxCard = -1):
        if min(minCard, maxCard) > 0:
            self.s.push()
        if minCard > 0:
            self.s.add(PbGe([(x,1) for x in self.vars], minCard))
        if maxCard > 0:
            self.s.add(PbLe([(x,1) for x in self.vars], maxCard))
        candidates = seed[:]
        while len(candidates) > 0:
            c = candidates[-1]
            candidates = candidates[:-1]
            if not self.is_critical(c, seed):
                seed.remove(c)
        if min(minCard, maxCard) > 0:
            self.s.pop()
        return seed

    # checks whether c is minable critical for N, i.e., whether N - {c} is unexplored
    def is_critical(self, c, N):
        assert c in N
        Nc = N[:]
        Nc.remove(c)
        return not self.is_unexplored(Nc)

    # checks whether c is minable conflicting for N, i.e., whether N \cup {c} is unexplored
    def is_conflicting(self, c, N):
        assert c not in N
        Nc = N + [c]
        for b in self.blockUps:
            if set(b).issubset(Nc):
                return True
        return False

    # checks if N is unexplored
    def is_unexplored(self, N):
        assumptions = [self.vars[c] for c in N] + [Not(self.vars[c]) for c in self.complement(N)]
        return (self.s.check(assumptions) == sat)
