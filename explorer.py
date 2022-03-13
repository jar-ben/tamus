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
        self.shadowBlockUps = []
        self.shadowBlockDowns = []

    def complement(self, N):
        return [i for i in range(self.dimension) if i not in N]

    def shadow_block_up(self, N, trace=None):
        self.shadowBlockUps.append({"set": N[:], "trace": trace})

    def shadow_block_down(self, N):
        self.shadowBlockDowns.append(N[:])

    def block_up(self, N):
        self.blockUps.append(N[:])
        block = [Not(self.vars[n]) for n in N]
        self.s.add(Or(block))

    def block_down(self, N):
        self.blockDowns.append(N[:])
        block = [self.vars[n] for n in self.complement(N)]
        self.s.add(Or(block))

    # gets a maximal unexplored subset of N
    def get_unex_subset(self, N):
        assumptions = [Not(self.vars[c]) for c in self.complement(N)]
        check = self.s.check(assumptions)
        if check == sat:
            seed = []
            m = self.s.model()
            for x in m:
                if is_true(m[x]):
                    seed.append(int(str(x)[1:]))
            # maximize
            for c in N:
                if c in seed:
                    continue
                if self.is_unexplored(seed + [c]):
                    seed.append(c)
            return seed
        return None

    def get_unex(self, minCard=-1, maxCard=-1):
        if max(minCard, maxCard) >= 0:
            self.s.push()
        if minCard >= 0:
            self.s.add(PbGe([(x, 1) for x in self.vars], minCard))
        if maxCard >= 0:
            self.s.add(PbLe([(x, 1) for x in self.vars], maxCard))

        check = self.s.check()
        if check == sat:
            seed = []
            m = self.s.model()
            for x in m:
                if is_true(m[x]):
                    seed.append(int(str(x)[1:]))
            if max(minCard, maxCard) >= 0:
                self.s.pop()
            return seed
        if max(minCard, maxCard) >= 0:
            self.s.pop()
        return None

    # maximize a given unexplored subset (seed)
    def maximize(self, seed, minCard=-1, maxCard=-1):
        if max(minCard, maxCard) >= 0:
            self.s.push()
        if minCard >= 0:
            self.s.add(PbGe([(x, 1) for x in self.vars], minCard))
        if maxCard >= 0:
            self.s.add(PbLe([(x, 1) for x in self.vars], maxCard))
        for c in self.complement(seed):
            if self.is_unexplored(seed + [c]):
                seed.append(c)
        if max(minCard, maxCard) >= 0:
            self.s.pop()
        return seed

    # minimize a given unexplored subset (seed)
    def minimize(self, seed, minCard=-1, maxCard=-1):
        if max(minCard, maxCard) >= 0:
            self.s.push()
        if minCard >= 0:
            self.s.add(PbGe([(x, 1) for x in self.vars], minCard))
        if maxCard >= 0:
            self.s.add(PbLe([(x, 1) for x in self.vars], maxCard))
        candidates = seed[:]
        while len(candidates) > 0:
            c = candidates[-1]
            candidates = candidates[:-1]
            Nc = seed[:]
            Nc.remove(c)
            if self.is_unexplored(Nc):
                seed.remove(c)
        if max(minCard, maxCard) >= 0:
            self.s.pop()
        return seed

    # checks whether c is minable critical for N, i.e., whether N - {c} is unexplored
    def is_critical(self, c, N):
        assert c in N
        Nc = N[:]
        Nc.remove(c)
        return (not self.is_unexplored(Nc)) or (not self.is_shadow_unexplored(Nc))

    # checks whether c is minable conflicting for N, i.e., whether N \cup {c} is unexplored
    def is_conflicting(self, c, N):
        assert c not in N
        Nc = N + [c]
        return (not self.is_unexplored(Nc)) or (not self.is_shadow_unexplored(Nc))

    def is_shadow_sufficient(self, N):
        for B in self.shadowBlockUps:
            if len(set(B["set"]) - set(N)) == 0:
                return (True, B["trace"])
        return (False, None)

    def is_shadow_insufficient(self, N):
        for B in self.shadowBlockDowns:
            if len(set(N) - set(B)) == 0:
                return True
        return False

    def is_shadow_unexplored(self, N):
        for B in self.shadowBlockUps:
            if len(set(B["set"]) - set(N)) == 0:
                return False
        for B in self.shadowBlockDowns:
            if len(set(N) - set(B)) == 0:
                return False
        return True

    # checks if N is unexplored
    def is_unexplored(self, N):
        assumptions = [self.vars[c] for c in N] + \
            [Not(self.vars[c]) for c in self.complement(N)]
        return (self.s.check(assumptions) == sat)
