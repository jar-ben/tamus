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
          

def get_template(ta_file_path, query_file_name):
    """Reads the ta file and returns template(s)."""
    query_file = open(query_file_name)
    query_string = query_file.read()
    qs_list = query_string.split(" ")
    qs_list = qs_list[1].split(".")
    template_instance_name = qs_list[0]
    location = qs_list[1].strip()
    template_name = get_template_name(ta_file_path, template_instance_name)
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


def verify_reachability(ta_file_path, query_file_path, print_result=False):
    """
    It generates the query E<> model_name.final_location, and verifies TA against it.

    :param ta_file_path: string for the xml file containing the ta model
    :param query_file_path: string, the q file containing the query
    :param print_result: Boolean
    :return: 1,0,-1, see verification_result.
    """

    global verification_result

    res = 0
    try:
        a , stdoutdata = pyuppaal.verify(ta_file_path, query_file_path,getoutput=True)
        if 'is satisfied' in stdoutdata:
            res = 1
        if 'is NOT satisfied' in stdoutdata:
            res = -1

    except Exception as e:
        print (e)
        pass
    #qf.deleteTempFile(qfh)
    if print_result:
        print ("Checking " + ta_file_path + " against query " + query_file_path)
        print ("\t" + verification_result[res])
    return res


def verifyWithTrace(modelfilename, queryfilename, verifyta='./bin-Windows/verifyta.exe'):
    #  modified version of verify from pyuppaal
    cmdline = verifyta + ' -t1 ' + ' -o0' + ' -S1' + ' -q ' + modelfilename + ' ' + queryfilename

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

    # Construct the trace
    trace = []
    for i in range(len(errlines)):
        line = errlines[i]
        if line.find('Transition') != -1:
            next_line = errlines[i + 1]
            start_of_state_1 = 1 + next_line.find('.')
            end_of_state_1 = next_line.find('-')
            state_1 = next_line[start_of_state_1:end_of_state_1]
            start_of_state_2 = 1 + next_line.find('.', start_of_state_1)
            end_of_state_2 = next_line.find('{') - 1
            state_2 = next_line[start_of_state_2:end_of_state_2]
            if len(trace) == 0:
                trace += [state_1]
            trace += [state_2]

    return stdoutdata, trace


def find_used_constraints(path, constraint_registry):
    path_dictionary = dict()
    for i in range(len(path)-1):
        path_dictionary[(path[i], path[i+1])] = []
    for i in range(len(path)):
        path_dictionary[path[i]] = []

    used_constraints = dict()
    for constraint in constraint_registry:
        if path_dictionary.get(constraint_registry[constraint][1]) is not None:
            used_constraints[constraint] = constraint_registry[constraint]
    return used_constraints
