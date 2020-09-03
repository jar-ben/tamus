import pyuppaal


def add_path(template, path_source, path_target, n, li, clocks, lower_bounds, upper_bounds, final_guard):
    """ Add n locations from path_source to path_target starting from li (integer).
        Add n+1 transitions to form a path.
        Given a set of clocks, a period and a threshold for each clock add resets and guards such that:
                In particular, bounds is a list of tuples of the form clock index ind - period p - bound b:
                clocks[ind] is reset and checked in every p-th transition with threshold b (upper or lower)
    """
    source=template.get_location_by_name(path_source)
    # Transition leaving l_0
    target_name = 'l'+str(li)
    target = pyuppaal.Location(name=target_name)
    template.locations += [target]
    # Reset each clock except the last one on transitions leaving l_0
    reset_str = ' , '.join([clocks[i] + " = 0 " for i in range(len(clocks))])
    template.transitions += [pyuppaal.Transition(source=source, target=target,
                                                 guard='', assignment=reset_str)]
    source=template.get_location_by_name(target_name)
    for i in range(1, n+1):
        id = i+li
        target_name = 'l'+str(id)
        if i == n: # the target is path_target, no need to add
            target_name=path_target
            target = template.get_location_by_name(target_name)
        else:
            target = pyuppaal.Location(name=target_name)
            template.locations += [target]
        clock_ind_lower = [] # the indices of clocks that will be checked and reset on source to target
        clock_ind_upper = []

        for j in range(len(lower_bounds)):
            if i % lower_bounds[j][1] == 0:
                clock_ind_lower += [j]
        for j in range(len(upper_bounds)):
            if i % upper_bounds[j][1] == 0:
                clock_ind_upper += [j]

        guard_str_lower = ' && '.join([clocks[lower_bounds[j][0]] + " >= " + str(lower_bounds[j][2]) for j in clock_ind_lower])
        guard_str_upper = ' && '.join([clocks[upper_bounds[j][0]] + " <= " + str(upper_bounds[j][2]) for j in clock_ind_upper])

        if guard_str_lower and guard_str_upper:
            guard_str = guard_str_lower + ' && ' + guard_str_upper
        elif guard_str_upper:
            guard_str = guard_str_upper
        elif guard_str_lower:
            guard_str = guard_str_lower
        else:
            guard_str = ''
        if i == n:
            guard_str = final_guard if not guard_str else final_guard + " && " + guard_str
        reset_indices = [lower_bounds[j][0] for j in clock_ind_lower] + \
                        [upper_bounds[j][0] for j in clock_ind_upper]
        reset_str = ' , '.join([clocks[i] + " = 0 " for i in reset_indices])

        template.transitions += [pyuppaal.Transition(source=source, target=target,
                                                     guard=guard_str, assignment=reset_str)]
        source=template.get_location_by_name(target_name)

    return template


def generator(clocks, lower_bounds, upper_bounds, final_guard, path_length, folder_path, ex_name):
    template = pyuppaal.Template("TA")
    template.locations += [pyuppaal.Location(name='l0')]
    template.initlocation = template.locations[0]
    template.locations += [pyuppaal.Location(name='l1')]
    nta = pyuppaal.NTA(templates=[template])

    nta.declaration = "clock " + ", ".join(clocks) + ";"
    nta.system = "\nta = TA();\n system ta;"

    start_index = 2
    # Add paths
    for i in range(len(lower_bounds)):
        add_path(template, 'l0', 'l1', path_length, start_index, clocks[0:-1],
                 lower_bounds[i], upper_bounds[i], final_guard)
        start_index += path_length

    # Store the model
    template.layout()
    xml_string = nta.to_xml()

    ta_file_path = folder_path + ex_name + ".xml"
    ta_file = open(ta_file_path, 'w')
    ta_file.write(xml_string)
    ta_file.close()
    query_file_path = folder_path +ex_name+".q"
    with open(query_file_path, "w") as query_file:
        query_file.write("E<> ta.l1")


def benchmark_generation_helper(ci, cc, t, lp, kl, ku):
    """ci lowest clock index, cc is clock count, t is used to determine thresholds,
    lp is the lowest period, the other periods are computed w.r.to lp,
    kl and ku are used in threshold computation."""

    cch = cc / 2 # half of it is used for lower bounds, half of it is used for upper bounds.
    lower_bounds = []
    upper_bounds = []

    for i in range(cch):
        # Set the lower bound
        lbp = (i+1)*lp
        ubp = lbp+1
        lower_bounds.append((i+ci, lbp, (i+1)*t + kl))
        upper_bounds.append((i+ci+cch, ubp, ubp*(t/lp) - ku))

    return lower_bounds, upper_bounds


def generate_benchmarks(folder):
    t = 10
    lp = 2
    kl = 1
    clocks = ['x0', 'x1', 'x2']
    ci = 3 # the index of the clock to be added next, always odd.
    cc = 2

    file_names = []
    # BENCHMARKS
    while ci < 8:
        for path_length in [6, 12, 18, 24, 30]:
            lower_bounds = []
            upper_bounds = []

            final_constraint = 'x' + str(cc) + " <= " + str(t * (path_length + 1))
            # First path
            lb, ub = benchmark_generation_helper(0, cc, t, lp, kl, 0)
            lower_bounds.append(lb)
            upper_bounds.append(ub)
            ex_name = 'test' + str(len(clocks)) + '_' + str(path_length) + '_' + str(len(lower_bounds))
            print ex_name, lower_bounds, upper_bounds
            generator(clocks, lower_bounds, upper_bounds, final_constraint, path_length, folder, ex_name)
            file_names.append(ex_name)
            # Second path
            lb, ub = benchmark_generation_helper(0, cc, 16, lp+2, kl, 0)
            lower_bounds.append(lb)
            upper_bounds.append(ub)
            ex_name = 'test' + str(len(clocks)) + '_' + str(path_length) + '_' + str(len(lower_bounds))
            print ex_name, lower_bounds, upper_bounds
            final_constraint = 'x' + str(cc) + " <= " + str(4 * (path_length-2) - 2)
            generator(clocks, lower_bounds, upper_bounds, final_constraint, path_length, folder, ex_name)
            file_names.append(ex_name)
        # Add two more clocks:
        clocks.append('x' + str(ci))
        clocks.append('x' + str(ci+1))
        ci += 2
        cc += 2
    return file_names

