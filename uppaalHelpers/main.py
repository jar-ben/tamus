import sys
import os.path

import pyuppaal
import ta_helper
import timed_automata


def main():
    model = 'data/m1.xml'
    final_location = 'l6'
    template = ta_helper.get_template(model)
    TA = timed_automata.TimedAutomata()
    TA.initialize_from_template(template)
    clist = TA.constraint_lists_for_all_paths('l6')
    ta_helper.verify_reachability(model, final_location)
    relax_set = ['c1', 'c6', 'c7']
    new_template = TA.generate_relaxed_template(relax_set)
    new_model = ta_helper.set_template_and_save(model, new_template)
    ta_helper.verify_reachability(new_model, final_location)

def init(model):
    final_location = '16' #TODO: this should be parametrized
    template = ta_helper.get_template(model)
    TA = timed_automata.TimedAutomata()
    TA.initialize_from_template(template)
    clist = TA.constraint_lists_for_all_paths('l6')
    assert len(clist) > 0
    print "paths: {}".format( " ".join([str(len(p)) for p in clist]))
   
def check(model, pid, active):
    final_location = 'l6'
    template = ta_helper.get_template(model)
    TA = timed_automata.TimedAutomata()
    TA.initialize_from_template(template)
    clist = TA.constraint_lists_for_all_paths('l6')
    path = clist[pid]
    assert len(path) == len(active)
    
    relax_set = []
    for i in range(len(path)):
        if active[i] == "0":
            relax_set.append(path[i])

    new_template = TA.generate_relaxed_template(relax_set)
    new_model = ta_helper.set_template_and_save(model, new_template)
    res = ta_helper.verify_reachability(new_model, final_location)
    print str(res),    

if __name__ == '__main__':
    assert len(sys.argv) > 2
    model = sys.argv[1]
    query = sys.argv[2]
    assert query in ["init", "check"]
    if query == "init":
        init(model)
    elif query == "check":
        assert len(sys.argv) > 4
        pid = int(sys.argv[3])
        active = sys.argv[4]
        check(model, pid, active)

