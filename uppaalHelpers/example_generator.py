import pyuppaal


def add_path(template, path_source, path_target, n, li, clocks, lower_bounds, upper_bounds, final_guard):
    """ Add n locations from path_source to path_target starting from li (integer).
        Add n+1 transitions to form a path.
        Given a set of clocks, a period and a threshold for each clock add resets and guards such that:
                In particular, bounds is a list of tuples of the form clock index ind - period p - bound b:
                clocks[ind] is reset and checked in every p-th transition with threshold b (upper or lower)
    """
    source=template.get_location_by_name(path_source)
    clock_count=len(clocks)
    for i in range(0, n+1):
        id=i+li
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
            if (i+1) % lower_bounds[j][1] == 0:
                clock_ind_lower += [j]
        for j in range(len(upper_bounds)):
            if (i+1) % upper_bounds[j][1] == 0:
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


def generate_benchmarks():
    # Paper benchmarks:
    folder = '../examples/generator/'

    # BENCHMARK 1: 3 clocks, 1 path, path length 6
    clocks = ['x0', 'x1', 'x2']
    # clock index , period , bound
    lower_bounds = [[(0, 1, 10)]]
    upper_bounds = [[(1, 2, 18)]]
    path_length = 6
    # number of clocks + length of each path + number of paths
    ex_name = 'test' + str(len(clocks)) + '_' + str(path_length) + '_' + str(len(lower_bounds))
    generator(clocks, lower_bounds, upper_bounds, 'x2 <= 60', path_length, folder, ex_name)

    # BENCHMARK 2: 3 clocks, 2 path, path length 6
    clocks = ['x0', 'x1', 'x2']
    # clock index , period , bound
    lower_bounds.append([(0, 1, 12)])
    upper_bounds.append([(1, 2, 20)])
    path_length = 6
    # number of clocks + length of each path + number of paths
    ex_name = 'test' + str(len(clocks)) + '_' + str(path_length) + '_' + str(len(lower_bounds))
    generator(clocks, lower_bounds, upper_bounds, 'x2 <= 60', path_length, folder, ex_name)

    # BENCHMARK 3: 3 clocks, 1 path, path length 10
    # clocks, periods, bounds, final_guard, path_lengths, folder_path, ex_name
    clocks = ['x0', 'x1', 'x2']
    # clock index , period , bound
    lower_bounds = [[(0, 1, 10)]]
    upper_bounds = [[(1, 2, 18)]]

    path_length = 10
    # number of clocks + length of each path + number of paths
    ex_name = 'test' + str(len(clocks)) + '_' + str(path_length) + '_' + str(len(lower_bounds))
    generator(clocks, lower_bounds, upper_bounds, 'x2 <= 100', path_length, folder, ex_name)

    # BENCHMARK 4: 3 clocks, 2 path, path length 10
    # clocks, periods, bounds, final_guard, path_lengths, folder_path, ex_name
    clocks = ['x0', 'x1', 'x2']
    # clock index , period , bound
    lower_bounds.append([(0, 1, 12)])
    upper_bounds.append([(1, 2, 20)])

    path_length = 10
    # number of clocks + length of each path + number of paths
    ex_name = 'test' + str(len(clocks)) + '_' + str(path_length) + '_' + str(len(lower_bounds))
    generator(clocks, lower_bounds, upper_bounds, 'x2 <= 100', path_length, folder, ex_name)

    # BENCHMARK 5: 4 clocks, 1 path, path length 10
    # clocks, periods, bounds, final_guard, path_lengths, folder_path, ex_name
    clocks = ['x0', 'x1', 'x2', 'x3']
    # clock index , period , bound
    lower_bounds = [[(0, 1, 10), (1, 2, 18)]]
    upper_bounds = [[(2, 3, 25)]]

    path_length = 10
    # number of clocks + length of each path + number of paths
    ex_name = 'test' + str(len(clocks)) + '_' + str(path_length) + '_' + str(len(lower_bounds))
    generator(clocks, lower_bounds, upper_bounds, 'x3 <= 100', path_length, folder, ex_name)

    # BENCHMARK 6: 4 clocks, 1 path, path length 10
    # clocks, periods, bounds, final_guard, path_lengths, folder_path, ex_name
    clocks = ['x0', 'x1', 'x2', 'x3']
    # clock index , period , bound
    lower_bounds.append([(0, 1, 8), (1, 2, 16)])

    upper_bounds.append([(2, 3, 20)])

    path_length = 10
    # number of clocks + length of each path + number of paths
    ex_name = 'test' + str(len(clocks)) + '_' + str(path_length) + '_' + str(len(lower_bounds))
    generator(clocks, lower_bounds, upper_bounds, 'x3 <= 100', path_length, folder, ex_name)

    # BENCHMARK 7: 4 clocks, 1 path, path length 20
    # clocks, periods, bounds, final_guard, path_lengths, folder_path, ex_name
    clocks = ['x0', 'x1', 'x2', 'x3']
    # clock index , period , bound
    lower_bounds = [[(0, 1, 10), (1, 2, 18)]]
    upper_bounds = [[(2, 3, 25)]]

    path_length = 20
    # number of clocks + length of each path + number of paths
    ex_name = 'test' + str(len(clocks)) + '_' + str(path_length) + '_' + str(len(lower_bounds))
    generator(clocks, lower_bounds, upper_bounds, 'x3 <= 200', path_length, folder, ex_name)

    # BENCHMARK 8: 4 clocks, 2 path, path length 20
    # clocks, periods, bounds, final_guard, path_lengths, folder_path, ex_name
    clocks = ['x0', 'x1', 'x2', 'x3']
    # clock index , period , bound
    lower_bounds.append([(0, 1, 8), (1, 2, 16)])

    upper_bounds.append([(2, 3, 20)])

    path_length = 20
    # number of clocks + length of each path + number of paths
    ex_name = 'test' + str(len(clocks)) + '_' + str(path_length) + '_' + str(len(lower_bounds))
    generator(clocks, lower_bounds, upper_bounds, 'x3 <= 200', path_length, folder, ex_name)

    # BENCHMARK 9: 5 clocks, 1 path, path length 20
    # clocks, periods, bounds, final_guard, path_lengths, folder_path, ex_name
    clocks = ['x0', 'x1', 'x2', 'x3', 'x4']
    # clock index , period , bound
    lower_bounds = [[(0, 1, 10), (1, 2, 18), (2, 3, 32)]]
    upper_bounds = [[(3, 3, 35)]]

    path_length = 20
    # number of clocks + length of each path + number of paths
    ex_name = 'test' + str(len(clocks)) + '_' + str(path_length) + '_' + str(len(lower_bounds))
    generator(clocks, lower_bounds, upper_bounds, 'x4 <= 200', path_length, folder, ex_name)

    # BENCHMARK 10: 5 clocks, 2 path, path length 20
    # clocks, periods, bounds, final_guard, path_lengths, folder_path, ex_name
    clocks = ['x0', 'x1', 'x2', 'x3', 'x4']
    # clock index , period , bound
    lower_bounds.append([(0, 1, 8), (1, 2, 16), (2, 3, 25)])
    upper_bounds.append([(3, 3, 30)])

    path_length = 20
    # number of clocks + length of each path + number of paths
    ex_name = 'test' + str(len(clocks)) + '_' + str(path_length) + '_' + str(len(lower_bounds))
    generator(clocks, lower_bounds, upper_bounds, 'x4 <= 200', path_length, folder, ex_name)

if __name__ == '__main__':

    generate_benchmarks()
