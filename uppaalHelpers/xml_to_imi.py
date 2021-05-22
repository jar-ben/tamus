import ta_helper

def parse_declaration(declaration_text):
    all_clocks = []
    all_discrete = []
    all_parameters = []
    lines = declaration_text.split("\n")
    for line in lines:
        space_splitted = line.split(" ")  # split the line according to spaces
        first_word = space_splitted[0].strip()

        if first_word == "clock":            # if the declaration is for clocks
            remaining_part = " ".join(space_splitted[1:]).split(";")[0]  # get the part before semicolon, clocks
            line_clocks = remaining_part.split(",")
            all_clocks += [clck.strip() for clck in line_clocks]
        if first_word == "int":            # if the declaration is for clocks
            remaining_part = " ".join(space_splitted[1:]).split(";")[0]  # get the part before semicolon, clocks
            line_clocks = remaining_part.split(",")
            all_discrete += [clck.strip() for clck in line_clocks]
        if first_word == "const":            # if the declaration is for clocks
            remaining_part = " ".join(space_splitted[1:]).split(";")[0]  # get the part before semicolon, clocks
            line_clocks = remaining_part.split(",")
            all_parameters += [clck.strip() for clck in line_clocks]
    return all_clocks, all_discrete, all_parameters


def parse_system(system_text):
    all_processes = []
    process_template_dictionary = {}
    lines = system_text.split("\n")
    for line in lines:
        line = line.strip()
        if line[:2] == "//":    # if the line is comment, then skip
            continue
        elif len(line) == 0:
            continue
        else:
            statement_part = line.split(";")[0]   # get the part before semicolon
            space_splitted_statement = statement_part.split(" ")
            if space_splitted_statement[0].strip() == "system":    # if the line contains system description
                processes = " ".join(space_splitted_statement[1:]).split(",")  # get the processes
                all_processes = [process.strip() for process in processes]     # remove the extra spaces and create list

            else:       # else there is a process declearation
                equal_sign_splitted = statement_part.split("=")
                # dict[process] = template, [:-2] is used to remove () part at the end
                process_template_dictionary[equal_sign_splitted[0].strip()] = equal_sign_splitted[1].strip()[:-2]

    return all_processes, process_template_dictionary


def fix_constraints(constraints):
    if constraints is None:  # if inv None or empty, it is written as True in imitator
        constraints = "True"
    else:
        constraints = constraints.strip()
        if constraints == "":
            constraints = "True"
        else:
            constraints = constraints.split("&&")  # else replace && ith & and == with =
            new_constraints = []
            for constraint in constraints:
                if "==" in constraint:
                    new_constraints.append("=".join(constraint.split("==")))
                else:
                    new_constraints.append(constraint)
            constraints = "&".join(new_constraints)
    return constraints


def fix_assignments(assignments):
    if assignments is None:
        assignments = ""
    else:
        assignments = assignments.strip()
        if assignments != "":
            assignments = ":=".join(assignments.split("="))  # if there are assignments, just replace = with :=
    return assignments


def create_imitator_on_mg(new_templates, declaration, system, model_name, query_name, parameter_count):
    # create the model
    model, templates = ta_helper.get_templates(model_name)

    create_the_new_templates(templates, new_templates)

    # create the file names for imitator
    imi_file_name = ".".join([query_name.split(".q")[0], "imi"])
    imiprop_file_name = ".".join([query_name.split(".q")[0], "imiprop"])
    imi_file = open(imi_file_name, "w+")

    clocks, discretes, _ = parse_declaration(declaration)

    _, process_template_dictionary = parse_system(system)  # in order to convert process name to template name
                                                           # currrently tamus does not support ntas with multiple processes
    initial_locations = []                                 # that has the same template, it is trivial to change it
                                                           # However for the benchmarks we have every process has its
    imi_file.write("var\n\t")                              # own template. In the future support can be added
    if len(clocks) > 0:
        imi_file.write(", ".join(clocks))                   # var
        imi_file.write("\n\t: clock;\n\t")                  # x, y, z :clock;
    if len(discretes) > 0:
        discrete_variables = [var.split("=")[0] for var in discretes]   # t, u, v :discrete;
        imi_file.write(", ".join(discrete_variables))
        imi_file.write("\n\t: discrete;\n")
    if parameter_count > 0:
        parameters = ["par"+str(i) for i in range(parameter_count)]       # p1, p2, p3 :parameter;
        imi_file.write("\t" + ", ".join(parameters))
        imi_file.write("\n\t: parameter;\n")
    """if len(parameters) > 0:
        imi_file.write(", ".join(parameters))
        imi_file.write("\n\t: parameter;\n\t")"""

    for template in new_templates:
        location_transition_dictionary = {}
        location_invariant_list = []
        initial_locations.append((template.name, template.initlocation.name.value))

        #                   Reading locations                           #
        for location in template.locations:
            location_id = location.id
            location_name = location.name.value
            location_invariant = location.invariant.value
            location_invariant = fix_constraints(location_invariant)

            location_invariant_list.append((location_id, location_name, location_invariant))
            location_transition_dictionary[location_id.strip()] = []                # we will append transition to here

        #                               Reading  transitions                        #
        syncs = set()

        for transiton in template.transitions:
            sync = transiton.synchronisation.value.strip()  # find all the synchronizations in the template
            if len(sync) != 0:
                if sync[-1] == "!" or sync[-1] == "?":
                    sync = sync[:-1]
                if sync not in syncs:
                    syncs.add(sync)
            else:
                sync = ""

            guard = transiton.guard.value
            assignment = transiton.assignment.value
            source = transiton.source.id        # Obwerve that we keep id for source and name for target, since
            target = transiton.target.name.value  # we assign transitions to source ids and use target names for print
            #                       fix the guard               #
            guard = fix_constraints(guard)
            assignment = fix_assignments(assignment)
            location_transition_dictionary[source.strip()].append((guard, sync, assignment, target))

        #                           Writing to a imi file                       #

        syncs = list(syncs)

        imi_file.write("\nautomaton " + template.name + "\n")

        imi_file.write("\nsynclabs: ")      # write synchronizations    synclabs: b1, b2;
        if len(syncs) > 0:
            imi_file.write(", ".join(syncs))
        imi_file.write(";\n\t")

        for location in location_invariant_list:
            imi_file.write("\nloc " + location[1] + ": invariant " + location[2] + "\n")    # loc loc1: invraiant inv1

            for transition in location_transition_dictionary[location[0].strip()]:
                if "!=" in transition[0]:
                    atomics = transition[0].split("!=")
                    not_equals = ["<".join(atomics), ">".join(atomics)]
                    for i in range(2):
                        imi_file.write("\twhen  " + not_equals[i] + " ")          # when guard sync b1 do {update] goto loc2
                        if transition[1] != "":
                            imi_file.write("sync " + transition[1] + " ")
                        if transition[2] != "":
                            imi_file.write("do {" + transition[2] + "} ")
                        imi_file.write("goto " + transition[3] + ";\n")
                else:
                    imi_file.write("\twhen  " + transition[0] + " ")  # when guard sync b1 do {update] goto loc2
                    if transition[1] != "":
                        imi_file.write("sync " + transition[1] + " ")
                    if transition[2] != "":
                        imi_file.write("do {" + transition[2] + "} ")
                    imi_file.write("goto " + transition[3] + ";\n")

        imi_file.write("\nend\n\n")

    #                  writing the initial locations, clock values, parameter constraints                    #
    imi_file.write("\n\n\ninit:=\n")
    for template_name, template_location in initial_locations:                      # init:=
        imi_file.write("\t& loc["+template_name+"] = " + template_location + "\n")
    if len(clocks) > 0:                                                             # &x = 0
        for clock in clocks:
            imi_file.write("\t& " + clock + " = 0\n")
    if len(discretes) > 0:                                                          # &t = 0
        for discrete in discretes:
            imi_file.write("\t& " + discrete + "\n")
    if parameter_count > 0:                                                         # &p1 >= 0
        for i in range(parameter_count):
            imi_file.write("\t& par" + str(i) + ">=0\n")
    imi_file.write(";\n\n\nend")

    query_file = open(query_name, "r")
    query = query_file.readline()[4:-1].split("&&")

    new_query = []
    for process in query:
        process_name = process.split(".")[0].strip()
        template_name = process_template_dictionary[process_name]
        target_location = process.split(".")[1].strip()
        new_query.append("loc[" + template_name + "]=" + target_location)

    #       property := #synth AGnot(loc[loc1] = End1 & loc[loc2] = End2)
    property_file = open(imiprop_file_name, "w+")
    property_file.write("property := #synth AGnot(" + "&".join(new_query) + ");")
    return imi_file_name, imiprop_file_name


def create_the_new_templates(templates, new_templates):
    new_template_names = []
    for template in new_templates:
        new_template_names.append(template.name)

    for template in templates:
        if template.name not in new_template_names:
            new_templates.append(template)
            print new_templates
