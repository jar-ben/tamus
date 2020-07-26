"""Methods for checking if a path is realizable, and relaxing constraints."""
from scipy.optimize import linprog


def is_realizable(ta, path):
    """Given the template, and the path, check whether its feasible."""
    # Get clocks along the path.
    clocks = []
    # for the first location
    compute_clocks(path, ta, clocks)
    clocks = sorted(clocks)
    print(clocks)
    construct_path_lp(path, clocks, ta)
    return


def compute_clocks(path, ta, clocks):
    # c : clock_name, operator, threshold, equality
    for c in ta.parsed_invariants[path[0]]:
        compute_clocks_helper(c, clocks)
    # along the path
    for i in range(1, len(path)):
        for c in ta.parsed_invariants[path[i]]:
            compute_clocks_helper(c, clocks)
        for c in ta.parsed_guards[(path[i-1], path[i])]:
            compute_clocks_helper(c, clocks)
        for x in ta.resets[(path[i-1],path[i])]:
            if x not in clocks:
                clocks.append(x)


def compute_clocks_helper(c, clocks):
    if c[0] not in clocks:
        clocks.append(c[0])


def construct_path_lp(path, clocks, ta):

    number_of_variables = len(path) - 1

    A = []  # A and B matrices for the optimization
    B = []
    clock_to_delay = dict() # A mapping from clocks to the delay variables,
    # the dictionary will be updated as we progress along the path.
    for x in clocks:
        clock_to_delay[x] = [0] # set all of them to delay 0 initially.

    for i in range(len(path)-1):
        # Add constraints for the invariant.
        # Leaving path[i]
        for c in ta.parsed_invariants[path[i]]:
            a, b = compute_constraint(clock_to_delay, c, number_of_variables)
            A.append(a)
            B.append(b)

        # Add constraints for the guards.
        for c in ta.parsed_guards[(path[i], path[i+1])]:
            a, b = compute_constraint(clock_to_delay, c, number_of_variables)
            A.append(a)
            B.append(b)

        # Apply reset:
        for x in ta.resets[(path[i], path[i+1])]:
            clock_to_delay[x] = [] # Reset

        # Add constraints for the invariant.
        # Entering path[i+1]:
        for c in ta.parsed_invariants[path[i+1]]:
            a, b = compute_constraint(clock_to_delay, c, number_of_variables)
            A.append(a)
            B.append(b)

        # Add delay variable to all clocks
        for x in clocks:
            clock_to_delay[x].append(i+1)

    # Set the cost:
    c = [1 for _ in range(len(path)-1)]
    result = linprog(c, A_ub=A, b_ub=B, method="revised simplex")
    return result.success


def compute_constraint(clock_to_delay, c, number_of_variables):
    # c : clock_name, operator, threshold, equality
    A_row = [0 for _ in range(number_of_variables)] # initialize the row
    for di in clock_to_delay[c[0]]: # Clock to delay mapping for A
        A_row[di] = 1

    B_row = c[2]
    if c[1] == '>': # multiply by -1
        A_row = [x*-1 for x in A_row]
        B_row = -1*B_row

    return A_row, B_row
