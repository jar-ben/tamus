import copy
import networkx as nx

#import matplotlib.pyplot as plt


class TimedAutomata:

    def __init__(self):
        """Empty TA constructor."""
        self.g = nx.MultiDiGraph()
        self.initial_location = None

        self.constraint_registry = dict()  # constraint_id: constraint, source-target/or location, quard
        self.template = None
        self.next_id = 0

    def initialize_from_template(self, template):
        """Initialize TA from pyuppaal template."""
        self.template = template
        self.initial_location = template.initlocation.name.value
        # Add each location as a node:
        for l in template.locations:
            self.g.add_node(l.name.value, invariant=l.invariant.value)
            # Add invariants to the registry.
            self._register_location_constraints(l)

        # Add each transition as an edge:
        for t in template.transitions:
            self.g.add_edge(t.source.name.value, t.target.name.value, key=t.guard.value)
            # Add the guards to the registry.
            self._register_transition_constraints(t)

        #print (self.constraint_registry)
    """ def plot(self):
        plt.subplot()
        nx.draw(self.g, with_labels=True, font_weight='bold')
        plt.show()
    """
    def _register_transition_constraints(self, t):
        """Register constraints. This will be only called from initialization function."""
        if not t.guard.value:
            return
        c_list = t.guard.value.split('&&') # TODO do not register the empty strings -- no constraint.
        for c in c_list:
            self.constraint_registry['c' + str(self.next_id)] = \
                [c, (t.source.name.value, t.target.name.value)]
            self.next_id += 1

    def _register_location_constraints(self, l):
        """Register constraints. This will be only called from initialization function."""
        if not l.invariant.value:
            return
        c_list = l.invariant.value.split('&&')
        for c in c_list:
            self.constraint_registry['c' + str(self.next_id)] = \
                [c, l.name.value]
            self.next_id += 1

    def constraint_lists_for_all_paths(self, final_location):
        """Generates a list of lists, each list corresponds to the set of constraints encountered in
        a path from initial location to the given final location."""
        paths = nx.all_simple_paths(self.g, self.initial_location, final_location)
        constraints = []
        for path in map(nx.utils.pairwise, paths):
            constraints.append([])
            for l_pair in path:
                # Invariant
                constraints[-1] = constraints[-1] + self._get_constraints_on_transition(l_pair[0])
                # Guard
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

        transition_relax_set = {}
        location_relax_set = {}
        for cid in relax_set:
            constraint, l_t = self.constraint_registry[cid]
            if isinstance(l_t, tuple): # A constraint along a transition.
                transition_relax_set.setdefault(l_t, []).append(constraint)  # Insert or append
            else:
                location_relax_set.setdefault(l_t, []).append(constraint)

        new_template = copy.deepcopy(self.template) # The relax operation will be performed on the new template.
        # Go through the transitions, relax them according to transition_relax_set.
        for t in new_template.transitions:
            t_relax_set = transition_relax_set.get((t.source.name.value, t.target.name.value),[])
            if t_relax_set:
                t.guard.value = self._relax_constraint(t.guard.value, t_relax_set)

        # Go through the locations, relax invariants according to the location_relax_set.
        for l in new_template.locations:
            l_relax_set = location_relax_set.get(l.name.value, [])
            if l_relax_set:
                l.invariant.value = self._relax_constraint(l.invariant.value, l_relax_set)

        return new_template

    def _relax_constraint(self, constraint, relax_set):
        """Returns a string by removing each constraint from the relax set. """
        constraint_list = constraint.split('&&')
        c_dif = [c for c in constraint_list if c not in relax_set] # InlinesSet difference for two lists.
        return ' && '.join(c_dif)

    def print_registry(self, file_name):
        f = open(file_name, "w")
        for k in sorted(self.constraint_registry.keys()):
            f.write(str(k) + " : " + str(self.constraint_registry[k]) + "\n")
        f.close()