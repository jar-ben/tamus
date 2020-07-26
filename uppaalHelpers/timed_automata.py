import copy
import networkx as nx

#import matplotlib.pyplot as plt


class TimedAutomata:

    def __init__(self):
        """Empty TA constructor."""
        self.g = nx.MultiDiGraph()
        self.initial_location = None

        self.constraint_registry = dict()  # constraint_id: constraint, source-target/or location, quard
        self.parsed_invariants = dict()  # location : parsed invariant ( a list)
        self.parsed_guards = dict()  # source-target : parsed guard (a list)
        self.resets = dict() # source-target : list of clocks to be reset
        self.clocks = []
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
            self._parse_reset(t)

        self.clocks = sorted(self.clocks)

        # For debugging
        # print (self.constraint_registry)
        # print(self.parsed_invariants)
        # print(self.parsed_guards)

    """ def plot(self):
        plt.subplot()
        nx.draw(self.g, with_labels=True, font_weight='bold')
        plt.show()
    """

    def initialize_path_TA_from_template(self, template, clist):
        """Initialize TA from pyuppaal template."""
        self.template = template
        # Prune the template so that it only contains transitions and locations from clist.
        # First find the indices of locations from clist:
        index_set = [i for i in range(len(self.template.locations))
                     if self.template.locations[i].name.value in clist]
        self.template.locations = [self.template.locations[i] for i in index_set]

        index_set = [i for i in range(len(self.template.transitions))
                     if self.template.transitions[i].source.name.value in clist and
                        self.template.transitions[i].target.name.value in clist]
        self.template.transitions = [self.template.transitions[i] for i in index_set]
        self.initialize_from_template(self.template)


    def _register_transition_constraints(self, t):
        """Register constraints. This will be only called from initialization function."""
        if not t.guard.value:
            self.parsed_guards[(t.source.name.value, t.target.name.value)] = []
            return
        c_list = t.guard.value.split('&&') # TODO do not register the empty strings -- no constraint.
        for c in c_list:
            self.constraint_registry['c' + str(self.next_id)] = \
                [c, (t.source.name.value, t.target.name.value)]
            self.next_id += 1
            self.parse_add_clock(c)
        self.parsed_guards[(t.source.name.value, t.target.name.value)] = [
            self.parse_inequality_simple(c) for c in c_list]

    def _register_location_constraints(self, l):
        """Register constraints. This will be only called from initialization function."""
        if not l.invariant.value:
            self.parsed_invariants[l.name.value] = []
            return
        c_list = l.invariant.value.split('&&')
        for c in c_list:
            self.constraint_registry['c' + str(self.next_id)] = \
                [c, l.name.value]
            self.next_id += 1
            self.parse_add_clock(c)
        # Parse each constraint from c_list:
        self.parsed_invariants[l.name.value] = [self.parse_inequality_simple(c) for c in c_list]

    def constraint_keys_for_ta(self):
        """Generates the list of simple constraints of TA"""
        return self.constraint_registry.keys()

    def constraint_lists_for_all_paths(self, final_location):
        """Generates a list of lists, each list corresponds to the set of constraints encountered in
        a path from initial location to the given final location."""
        paths = nx.all_simple_paths(self.g, self.initial_location, final_location)
        constraints = []
        paths_processed = []
        # Get the path as the list of locations
        for path in map(nx.utils.pairwise, paths):
            constraints.append([])
            paths_processed.append([self.initial_location])
            for l_pair in path:
                # Invariant
                constraints[-1] = constraints[-1] + self._get_constraints_on_transition(l_pair[0])
                # Guard
                constraints[-1] = constraints[-1] + self._get_constraints_on_transition(l_pair)
                # Location to path
                paths_processed[-1].append(l_pair[1])
        return constraints, paths_processed

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

    def parse_inequality_simple(self, inequality):
        ind = 0
        for i in range(len(inequality)):
            if inequality[i] in ['<', '>']:
                ind = i
                break
        clock_name = inequality[0:ind].strip()
        operator = inequality[ind]
        equality = False
        if inequality[ind+1] == '=':
            ind += 1
            equality = True
        rest = inequality[ind+1:].strip()
        threshold = int(rest)

        return clock_name, operator, threshold, equality

    def _parse_reset(self, t):
        r_list = t.assignment.value.split(',')
        self.resets[(t.source.name.value, t.target.name.value)] = []
        for r in r_list:
            if len(r) != 0:
                clock_name = self.parse_add_clock(r)
                self.resets[(t.source.name.value, t.target.name.value)].append(clock_name)

    def parse_add_clock(self, inequality):
        """Input is an inequality x < 10 or x >= p1, add x to the set of clocks."""
        ind = 0
        for i in range(len(inequality)):
            if inequality[i] in ['>', '<', '=']:
                ind = i
                break
        clock_name = inequality[0:ind].strip()
        if clock_name not in self.clocks:
            self.clocks.append(clock_name)
        return clock_name