import subprocess

from . import pyuppaal

verification_result = {1: 'property is satisfied',
                       0: 'unknown', -1: 'property is not satisfied'}


def get_template_name(ta_file_path, model_name):
    string_catch = model_name + " = "
    template_name = ""
    with open(ta_file_path, 'r') as myfile:
        for line in myfile:
            if line.startswith(string_catch):
                line_s = line.split(" ")
                template_name = line_s[-1]
                template_name = template_name[:template_name.index('(')]
                break
    return template_name


def get_template(ta_file_path, query_file_name, template_name):
    """Reads the ta file and returns template(s)."""
    query_file = open(query_file_name)
    query_string = query_file.read()
    qs_list = query_string.split(" ")
    qs_list = qs_list[1].split(".")
    location = qs_list[1].strip()
    ta_file = open(ta_file_path)
    nta = pyuppaal.NTA.from_xml(ta_file)
    for template in nta.templates:
        if template.name == template_name:
            return nta, template, location


def get_templates(ta_file_path):
    ta_file = open(ta_file_path)
    nta = pyuppaal.NTA.from_xml(ta_file)

    templates = []
    for template in nta.templates:
        templates.append(template)
    return nta, templates


def set_templates_and_save(ta_file_path, nta, templates, ta_file_path_new=None):
    """Set template as the first one and store the result."""
    template_dictionary = {template.name: template for template in templates}

    for index in range(len(nta.templates)):
        if template_dictionary.get(nta.templates[index].name) is not None:
            nta.templates[index] = template_dictionary[nta.templates[index].name]

    xml_string = nta.to_xml()
    if not ta_file_path_new:
        ta_file_path_new = ta_file_path[0:-4] + "_new.xml"

    new_ta_file = open(ta_file_path_new, 'w')
    new_ta_file.write(xml_string)
    new_ta_file.close()
    return ta_file_path_new


def verify_reachability(ta_file_path, query_file_path, TA, relaxation_set, template_name, print_result=False):
    """
    It generates the query E<> model_name.final_location, and verifies TA against it.

    :param ta_file_path: string for the xml file containing the ta model
    :param query_file_path: string, the q file containing the query
    :param print_result: Boolean
    :param TA: TimedAutomata, we need the constraint registry
    :param relaxation_set: list containing constraints to be relaxed
    :return res: 1,0,-1, see verification_result.
    :return used_constraints: dictionary containing constraints from relaxation set that are needed for the trace
    """

    global verification_result
    constraint_registry = TA.constraint_registry

    trace = []
    res = 0
    used_constraints = {}
    try:
        stdoutdata, traces = verifyWithTrace(
            ta_file_path, query_file_path, template_name)
        if 'is satisfied' in stdoutdata:
            res = 1
            used_constraints = {}
            for trace in traces:
                used_constraints = find_used_constraints(
                    trace, constraint_registry, relaxation_set, used_constraints)
            if used_constraints == {}:
                print("Something wrong happened with verifyta")
                #  used_constraints = relaxation_set
        if 'is NOT satisfied' in stdoutdata:
            res = -1

    except Exception as e:
        print(e)
        pass
    #  qf.deleteTempFile(qfh)
    if print_result:
        print(("Checking " + ta_file_path + " against query " + query_file_path))
        print(("\t" + verification_result[res]))
    return res, used_constraints, trace


def verifyWithTrace(modelfilename, queryfilename, template_name, verifyta='verifyta'):
    #  modified version of verify from pyuppaal, change parameter verifyta to where verifyta is
    cmdline = ''

    cmdline += verifyta + ' -t1 ' + ' -o0' + ' -S1' + \
        ' -q ' + modelfilename + ' ' + queryfilename

    # print 'Executing', cmdline
    proc = subprocess.Popen(
        cmdline,
        stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)

    (stdoutdata, stderrdata) = proc.communicate()
    errlines = stderrdata.split('\n')

    # Construct the trace
    trace = {}
    i = 0
    template_names = {}  # template_instance_name : template_name
    while i < len(errlines):
        line = errlines[i]
        if line.find('Transition') != -1:
            i += 1
            transition_line = errlines[i]
            while transition_line.find('State') == -1:

                start_of_state_1 = transition_line.find('.')+1
                t_instance_name = transition_line[:start_of_state_1 - 1].strip()
                if t_instance_name == '':
                    i += 1
                    transition_line = errlines[i]
                    continue

                end_of_state_1 = transition_line.find('-')
                state_1 = transition_line[start_of_state_1:end_of_state_1]

                start_of_state_2 = 1 + \
                    transition_line.find('.', end_of_state_1)
                end_of_state_2 = transition_line.find(' ', end_of_state_1)
                state_2 = transition_line[start_of_state_2:end_of_state_2]

                start_of_identifiers = transition_line.find('{') + 1
                end_of_identifiers = transition_line.find('}')

                identifiers = transition_line[start_of_identifiers:end_of_identifiers]
                sync_start = identifiers.find(',')
                sync_end = identifiers.find(',', sync_start+1)
                sync = identifiers[sync_start + 2: sync_end]
                if sync == 'tau':
                    sync = ''

                if template_names.get(t_instance_name) is not None:
                    instance_template_name = template_names[t_instance_name]
                else:
                    instance_template_name = get_template_name(
                        modelfilename, t_instance_name)
                    template_names[t_instance_name] = instance_template_name

                if t_instance_name in trace:
                    trace[t_instance_name].append(
                        (instance_template_name, state_1, state_2, sync))
                    trace[t_instance_name].append(
                        (instance_template_name, state_2))
                else:
                    trace[t_instance_name] = [(instance_template_name, state_1),
                                              (instance_template_name,
                                               state_1, state_2, sync),
                                              (instance_template_name, state_2)]
                i += 1
                transition_line = errlines[i]
        i += 1

    result_traces = []
    if template_name != "All":
        for key in trace:
            instance_template_name = get_template_name(modelfilename, key)
            if instance_template_name == template_name:
                result_traces.append(trace[key])
    else:
        for key in trace:
            result_traces.append(trace[key])
    return stdoutdata, result_traces


def find_used_constraints(path, constraint_registry, relaxation_set, used_constraints):

    path_dictionary = dict()

    for i in range(len(path)):
        path_dictionary[path[i]] = []

    for constraint in relaxation_set:
        if path_dictionary.get(constraint_registry[constraint][1]) is not None:
            used_constraints[constraint] = constraint_registry[constraint]
    return used_constraints
