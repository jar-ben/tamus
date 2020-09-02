import subprocess
import pyuppaal

verification_result = {1: 'property is satisfied', 0: 'unknown', -1: 'property is not satisfied'}


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


def set_template_and_save(ta_file_path, nta, template, ta_file_path_new=None):
    """Set template as the first one and store the result."""
    for index in range(len(nta.templates)):
        if nta.templates[index].name == template.name:
            nta.templates[index] = template
            break
    xml_string = nta.to_xml()
    if not ta_file_path_new:
        ta_file_path_new = ta_file_path[0:-4] + "_new.xml"

    new_ta_file = open(ta_file_path_new, 'w')
    new_ta_file.write(xml_string)
    new_ta_file.close()
    return ta_file_path_new


def verify_reachability(ta_file_path, query_file_path, TA, relaxation_set, print_result=False):
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
        stdoutdata, trace = verifyWithTrace(ta_file_path, query_file_path)
        if 'is satisfied' in stdoutdata:
            res = 1
            used_constraints = find_used_constraints(trace, constraint_registry, relaxation_set)
            if used_constraints == {}:
                used_constraints = relaxation_set
        if 'is NOT satisfied' in stdoutdata:
            res = -1

    except Exception as e:
        print (e)
        pass
    #  qf.deleteTempFile(qfh)
    if print_result:
        print ("Checking " + ta_file_path + " against query " + query_file_path)
        print ("\t" + verification_result[res])
    return res, used_constraints, trace


def verifyWithTrace(modelfilename, queryfilename, verifyta='verifyta'):
    #  modified version of verify from pyuppaal, change parameter verifyta to where verifyta is
    cmdline = ''

    cmdline += verifyta + ' -t1 ' + ' -o0' + ' -S1' + ' -q ' + modelfilename + ' ' + queryfilename

    # print 'Executing', cmdline
    proc = subprocess.Popen(
        cmdline,
        stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)

    (stdoutdata, stderrdata) = proc.communicate()
    errlines = stderrdata.split('\n')
    # Look for tell-tale signs that something went wrong
    for line in errlines:
        if "Internet connection is required for activation." in line:
            raise Exception("UPPAAL verifyta error: " + line)

    query_file = open(queryfilename)
    query_string = query_file.read()
    qs_list = query_string.split(" ")
    qs_list = qs_list[1].split(".")
    template_instance_name = qs_list[0]

    # Construct the trace
    trace = []
    i = 0
    while i < len(errlines):
        line = errlines[i]
        if line.find('Transition') != -1:
            flag = 1
            i += 1
            transition_line = errlines[i]
            while transition_line.find('State') == -1:
                if transition_line[2:transition_line.find('.')] == template_instance_name:
                    flag = 0
                    break
                i += 1
                transition_line = errlines[i]
            if flag:
                continue

            start_of_state_1 = transition_line.find(template_instance_name)
            start_of_state_1 += len(template_instance_name) + 1
            end_of_state_1 = transition_line.find('-')
            state_1 = transition_line[start_of_state_1:end_of_state_1]
            start_of_state_2 = 1 + transition_line.find('.', end_of_state_1)
            end_of_state_2 = transition_line.find(' ', end_of_state_1)
            state_2 = transition_line[start_of_state_2:end_of_state_2]
            if len(trace) == 0:
                trace += [state_1]
            trace += [state_2]
        i += 1
    return stdoutdata, trace


def find_used_constraints(path, constraint_registry, relaxation_set):
    path_dictionary = dict()
    for i in range(len(path)-1):
        path_dictionary[(path[i], path[i+1])] = []
    for i in range(len(path)):
        path_dictionary[path[i]] = []

    used_constraints = dict()
    for constraint in relaxation_set:
        if path_dictionary.get(constraint_registry[constraint][1]) is not None:
            used_constraints[constraint] = constraint_registry[constraint]
    return used_constraints
