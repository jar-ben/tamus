import sys
import os.path

import pyuppaal
import ta_helper
import timed_automata



def init(model, location):
    template = ta_helper.get_template(model)
    TA = timed_automata.TimedAutomata()
    TA.initialize_from_template(template)
    clist = TA.constraint_lists_for_all_paths(location)
    assert len(clist) > 0
    print "paths: {}".format( " ".join([str(len(p)) for p in clist]))
   
def check(model, location, pid, active):
    template = ta_helper.get_template(model)
    TA = timed_automata.TimedAutomata()
    TA.initialize_from_template(template)
    clist = TA.constraint_lists_for_all_paths(location)
    path = clist[pid]
    assert len(path) == len(active)
    
    relax_set = []
    for i in range(len(path)):
        if active[i] == "0":
            relax_set.append(path[i])

    new_template = TA.generate_relaxed_template(relax_set)
    new_model = ta_helper.set_template_and_save(model, new_template)
    res = ta_helper.verify_reachability(new_model, location)
    print str(res),    

if __name__ == '__main__':
    assert len(sys.argv) > 3
    model = sys.argv[1]
    query = sys.argv[2]
    location = sys.argv[3]
    assert query in ["init", "check"]
    if query == "init":
        init(model, location)
    elif query == "check":
        assert len(sys.argv) > 5
        pid = int(sys.argv[4])
        active = sys.argv[5]
        check(model, location, pid, active)

