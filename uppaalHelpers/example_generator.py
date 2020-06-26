import pyuppaal


def add_path(template, path_source, path_target, n, li, clocks, clock_transition_period,
             clock_threshold, final_guard):
    """ Add n locations from path_source to path_target starting from li (integer).
        Add n+1 transitions to form a path.
        Given a set of clocks, a period and a threshold for each clock add resets and guards such that:
              clock[i] is reset and checked in every clock_transition_period[i]th transition.
    """
    source=template.get_location_by_name(path_source)
    clock_count=len(clocks)
    for i in range(0, n+1):
        id=i+li
        target_name='l'+str(id)
        if i == n: # the target is path_target, no need to add
            target_name=path_target
            target=template.get_location_by_name(target_name)
        else:
            target = pyuppaal.Location(name=target_name)
            template.locations += [target]
        clock_ind = [] # the indices of clocks that will be checked and reset on source to targett
        for j in range(0,clock_count):
            if (i+1) % clock_transition_period[j] == 0:
                clock_ind += [j]

        guard_str = ' && '.join([clocks[j] + " >= " + clock_threshold[j] for j in clock_ind])
        if i == n:
            guard_str = final_guard if not guard_str else final_guard + " && " + guard_str
        reset_str = ' , '.join([clocks[i] + " = 0 " for i in clock_ind])

        template.transitions += [pyuppaal.Transition(source=source, target=target,
                                                     guard=guard_str, assignment=reset_str)]
        source=template.get_location_by_name(target_name)

    return template




if __name__ == '__main__':

    template = pyuppaal.Template("TA")
    template.locations += [pyuppaal.Location(name='l0')]
    template.initlocation = template.locations[0]
    template.locations += [pyuppaal.Location(name='l1')]
    nta = pyuppaal.NTA(templates=[template])


    # ex_name = "test_case1"
    # ta_file_path = '../examples/'+ex_name+".xml"
    #
    # clocks = ['x0', 'x1', 'x2', 'x3']
    # nta.declaration = "clock " + ", ".join(clocks) + ";"
    # nta.system = "\nta = TA();\n system ta;"
    # add_path(template, 'l0', 'l1', 10, 2, clocks[0:-1], [1,2,3], ['10', '25', '35'],"x3 <= 120")

    ex_name = "test_case2"
    ta_file_path = '../examples/'+ex_name+".xml"

    clocks = ['x0', 'x1', 'x2', 'x3']
    nta.declaration = "clock " + ", ".join(clocks) + ";"
    nta.system = "\nta = TA();\n system ta;"
    add_path(template, 'l0', 'l1', 10, 2, clocks[0:-1], [1,2,3], ['10', '25', '35'],"x3 <= 120")
    add_path(template, 'l0', 'l1', 10, 12, clocks[0:-1], [1,2,3], ['15', '20', '36'],"x3 <= 120")



    template.layout()
    xml_string = nta.to_xml()
    # query = "<queries> <query> <formula> E&lt;&gt; ta.l1 </formula> </query> </queries> </nta>"
    # xml_string=xml_string.replace('</nta>', query)
    ta_file = open(ta_file_path, 'w')
    ta_file.write(xml_string)
    ta_file.close()
    query_file_path = '../examples/'+ex_name+".q"
    with open(query_file_path, "w") as query_file:
        query_file.write("E<> ta.l1")

