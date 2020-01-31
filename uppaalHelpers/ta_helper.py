
import pyuppaal

next_id = 1
verification_result = {1: 'property is satisfied', 0: 'unknown', -1: 'property is not satisfied'}


def get_template(ta_file_path, id=0):
    """Reads the ta file and returns template(s)."""
    ta_file = open(ta_file_path)
    nta = pyuppaal.NTA.from_xml(ta_file)
    if id=='all':
        return nta
    return nta.templates[id]


def set_template_and_save(ta_file_path, template, ta_file_path_new=None):
    """Read the network of ta from file, set template as the first one and store the result."""
    ta_file = open(ta_file_path)
    nta = pyuppaal.NTA.from_xml(ta_file)
    nta.templates[0] = template
    xml_string = nta.to_xml()
    if not ta_file_path_new:
        ta_file_path_new = ta_file_path[0:-4] + "_new.xml"

    new_ta_file = open(ta_file_path_new, 'w')
    new_ta_file.write(xml_string)
    new_ta_file.close()
    return ta_file_path_new


def verify_reachability(ta_file_path, final_location, print_result=False):
    """
    It generates the query E<> model_name.final_location, and verifies TA against it.

    :param ta_file_path: string for the xml file containing the ta model
    :param final_location: string, it is the name of the final location.
    :param print_result: Boolean
    :return: 1,0,-1, see verification_result.
    """

    global verification_result

    # Construct query file:
    ta_file = open(ta_file_path)
    nta = pyuppaal.NTA.from_xml(ta_file)
    query = 'E<> ' + nta.templates[0].name + "." + final_location
    del nta
    qf = pyuppaal.QueryFile(query)
    (qfh, qfname) = qf.getTempFile()

    res = 0
    try:
        a , stdoutdata = pyuppaal.verify(ta_file_path, qfname,getoutput=True)
        if 'is satisfied' in stdoutdata:
            res = 1
        if 'is NOT satisfied' in stdoutdata:
            res = -1

    except Exception as e:
        print (e)
        pass
    qf.deleteTempFile(qfh)
    if print_result:
        print ("Checking " + ta_file_path + " against query " + query)
        print ("\t" + verification_result[res])
    return res






