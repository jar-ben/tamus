#include "core/Master.h"
#include "core/misc.h"
#include <algorithm>
#include <math.h>
#include <functional>
#include <random>

void Master::tamus(){
	Formula top = explorer->get_unexplored(1, false);
	while(!top.empty()){
		cout << "iteration" << endl;
		if(is_valid(top, true, true)){
			cout << "valid" << endl;
			mark_MSS(top);
		}else{
			cout << "invalid" << endl;
			MUS mus = shrink_formula(top);
			mark_MUS(mus);
		}
		top = explorer->get_unexplored(1, false);
	}
}

