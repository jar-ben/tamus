import networkx as nx

#import matplotlib.pyplot as plt

next_id = 0


class TimedAutomata:

    def __init__(self):
        """Empty TA constructor."""
        self.g = nx.MultiDiGraph()
        self.initial_location = None

        self.constraint_registry = dict()  # constraint_id: constraint, source-target, quard
        self.template = None

    def initialize_from_template(self, template):
        """Initialize TA from pyuppaal template."""
        self.template = template
        self.initial_location = template.initlocation.name.value
        # Add each location as a node:
        for l in template.locations:
            self.g.add_node(l.name.value, invariant=l.invariant.value)
            # TODO add invariants

        # Add each transition as an edge:
        for t in template.transitions:
            self.g.add_edge(t.source.name.value, t.target.name.value, key=t.guard.value)
            # Add the guards to the registry.
            self._register_constraints(t)

        #print (self.constraint_registry)

    """ def plot(self):
        plt.subplot()
        nx.draw(self.g, with_labels=True, font_weight='bold')
        plt.show()
    """
    def _register_constraints(self, t):
        """Register constraints. This will be only called from initialization function."""
        global next_id
        c_list = t.guard.value.split('&&')
        for c in c_list:
            self.constraint_registry['c' + str(next_id)] = \
                [c, (t.source.name.value, t.target.name.value), t.guard.value]
            next_id += 1

    def constraint_lists_for_all_paths(self, final_location):
        """Generates a list of lists, each list corresponds to the set of constraints encountered in
        a path from initial location to the given final location."""
        paths = nx.all_simple_paths(self.g, self.initial_location, final_location)
        constraints = []
        for path in map(nx.utils.pairwise, paths):
            constraints.append([])
            for l_pair in path:
                constraints[-1] = constraints[-1] + self._get_constraints_on_transition(l_pair)
        return constraints

    def _get_constraints_on_transition(self, pair):
        ids = []
        for key in self.constraint_registry:
            value = self.constraint_registry[key]
            if value[1] == pair:
                ids.append(key)
        return ids

    def generate_relaxed_template(self, relax_set):
        """Removes the constraints from the relaxed set and returns the resulting template."""

        new_template = self.template
        for cid in relax_set:
            c, (l_source, l_target), guard = self.constraint_registry[cid]
            guard_list = guard.split('&&')
            guard_list.remove(c)
            guard_relaxed = ' && '.join(guard_list)
            for t in new_template.transitions:
                if t.source.name.value == l_source and t.target.name.value == l_target \
                        and t.guard.value == guard:
                    t.guard.value = guard_relaxed
                    break
        return new_template
