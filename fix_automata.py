
def fix_automata(file_path, clocks, parameters, n=1):

    r_file = open(file_path, 'r')
    w_file = open(file_path[0:-4] + '_fixed.xml', 'w')

    for line in r_file:

        if "label kind=\"invariant\"" in line or "label kind=\"guard\"" in line:
            constraints_start = line.find('>') + 1
            constraints_end = line.find('<', constraints_start)
            constraints = line[constraints_start: constraints_end]
            constraints = constraints.split('&amp;&amp;')

            w_file.write(line[:constraints_start])
            print(line)
            result = []
            for c in constraints:
                if '&gt;' in c:
                    t_start = c.find('&gt;')
                    if c[t_start+4] == '=':
                        atomic = c.split('&gt;=')
                        relation = '&gt;='
                    else:
                        atomic = c.split('&gt;')
                        relation = '&gt;'

                    clock, threshold = find_atomics(atomic[0], atomic[1], clocks, parameters, n)
                    c = clock + ' ' + relation + ' ' + threshold
                    result.append(c)

                elif '&lt;' in c:
                    t_start = c.find('&lt;')
                    if c[t_start + 4] == '=':
                        atomic = c.split('&lt;=')
                        relation = '&lt;='
                    else:
                        atomic = c.split('&lt;')
                        relation = '&lt;'

                    clock, threshold = find_atomics(atomic[0], atomic[1], clocks, parameters, n)
                    c = clock + ' ' + relation + ' ' + threshold
                    result.append(c)

                elif '=' in c:
                    t_start = c.find('=')
                    if c[t_start + 1] == '=':
                        atomic = c.split('==')
                    else:
                        atomic = c.split('=')

                    clock, threshold = find_atomics(atomic[0], atomic[1], clocks, parameters, n)

                    c1 = clock + ' ' + '&lt;=' + ' ' + threshold
                    c2 = clock + ' ' + '&gt;=' + ' ' + threshold

                    result.append(c1)
                    result.append(c2)
            print(result)

            w_file.write('&amp;&amp;'.join(result))
            w_file.write(line[constraints_end:])

        else:
            w_file.write(line)


def find_atomics(left_hand_side, right_hand_side, clocks, parameters, n):

    left_hand_side = left_hand_side.split('*')
    right_hand_side = right_hand_side.split('*')

    for i in range(len(left_hand_side)):
        left_hand_side[i] = left_hand_side[i].strip()

    for i in range(len(right_hand_side)):
        right_hand_side[i] = right_hand_side[i].strip()

    if len(left_hand_side) == 1 and left_hand_side[0] in clocks:
        clock = left_hand_side[0]
        threshold = right_hand_side
        coefficient = 1

    elif len(left_hand_side) == 2 and left_hand_side[0] in clocks:
        clock = left_hand_side[0]
        threshold = right_hand_side
        coefficient = int(left_hand_side[1])

    elif len(left_hand_side) == 2 and left_hand_side[1] in clocks:
        clock = left_hand_side[1]
        threshold = right_hand_side
        coefficient = int(left_hand_side[0])

    elif len(right_hand_side) == 1 and right_hand_side[0] in clocks:
        clock = right_hand_side[0]
        threshold = left_hand_side
        coefficient = 1

    elif len(right_hand_side) == 2 and right_hand_side[0] in clocks:
        clock = right_hand_side[0]
        threshold = left_hand_side
        coefficient = int(right_hand_side[1])

    elif len(right_hand_side) == 2 and right_hand_side[1] in clocks:
        clock = right_hand_side[1]
        threshold = left_hand_side
        coefficient = int(right_hand_side[0])

    else:
        if len(left_hand_side) == 1 and left_hand_side[0] not in parameters:
            clock = left_hand_side[0]
            threshold = right_hand_side
            coefficient = 1
        else:
            clock = right_hand_side[0]
            threshold = left_hand_side
            coefficient = 1
    print threshold
    coefficient_p = 1

    if len(threshold) == 1:
        if threshold[0] in parameters:
            threshold = parameters[threshold[0]]
        else:
            threshold = threshold[0]
    else:
        if threshold[0] in parameters:
            threshold = parameters[threshold[0]]
            coefficient_p = int(threshold[1])
        else:
            threshold = parameters[threshold[1]]
            coefficient_p = int(threshold[0])

    threshold = int(threshold) * float(n) * coefficient_p / coefficient

    return clock, str(int(threshold))
