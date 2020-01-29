#include "Master.h"
#include "misc.h"
#include <algorithm>
#include <math.h>
#include <functional>
#include <random>


Master::Master(string filename, string alg, string location){

        isValidExecutions = 0;
	algorithm = alg;
	sat_solver = "default";
	if(ends_with(filename, "xml")){
		satSolver = new TAHandle(filename, location);
		domain = "ta";
	}
	else if(ends_with(filename, "cnf")){
		satSolver = new MSHandle(filename);
		domain = "sat";
	}
	else
		print_err("The input file has to have one of these extensions: .cnf or .xml. See example files in ./examples/ folder.");
	dimension = satSolver->dimension;	
	cout << "Number of constraints in the input set:" << dimension << endl;
        explorer = new Explorer(dimension);	
	explorer->satSolver = satSolver;
        verbose = false;
	depthMUS = 0;
	dim_reduction = 0.5;
	output_file = "";
	validate_mus_c = false;
	current_depth = 0;
	unex_sat = unex_unsat = 0;
        hash = random_number();
	satSolver->hash = hash;
}

Master::~Master(){
	delete satSolver;
	delete explorer;
}

void Master::write_mus_to_file(MUS& f){
	satSolver->exportMUS(f.bool_mus, output_file);
}

// mark formula and all of its supersets as explored
void Master::block_up(MUS& formula){
	explorer->block_up(formula);
}

// mark formula and all of its subsets as explored
void Master::block_down(Formula formula){
        explorer->block_down(formula);
}

// check formula for satisfiability
// core and grow controls optional extraction of unsat core and model extension (replaces formula)
bool Master::is_valid(Formula &formula, bool core, bool grow){
	bool sat = satSolver->solve(formula, core, grow); 
	if(sat) unex_sat++;
	else unex_unsat++;
	return sat;
}

//verify if f is a MUS
void Master::validate_mus(Formula &f){
	if(is_valid(f))
		print_err("the mus is SAT");
	if(!explorer->isUnexplored(f))
		print_err("this mus has been already explored");
	for(int l = 0; l < f.size(); l++)
		if(f[l]){
			f[l] = false;
			if(!is_valid(f))
				print_err("the mus has an unsat subset");	
			f[l] = true;
		}	
}

MUS& Master::shrink_formula(Formula &f, Formula crits){
	int f_size = count_ones(f);
	chrono::high_resolution_clock::time_point start_time = chrono::high_resolution_clock::now();
	if(verbose) cout << "shrinking dimension: " << f_size << endl;
	f_size = count_ones(f);
	if(crits.empty()) crits = explorer->critical;
	if(false && get_implies){ //get the list of known critical constraints	
		explorer->getImplied(crits, f);	
		if(verbose) cout << "# of known critical constraints before shrinking: " << count_ones(crits) << endl;	
		float c_crits = count_ones(crits);
		if(int(c_crits) == f_size){ // each constraint in f is critical for f, i.e. it is a MUS 
			muses.push_back(MUS(f, -1, muses.size(), f_size)); //-1 duration means skipped shrink
			return muses.back();
		}			
		if(!is_valid(crits, false, false)){ 
			muses.push_back(MUS(crits, -1, muses.size(), f_size));//-1 duration means skipped shrink
			return muses.back();
		}
	}

	Formula mus = satSolver->shrink(f, crits);
	chrono::high_resolution_clock::time_point end_time = chrono::high_resolution_clock::now();
	auto duration = chrono::duration_cast<chrono::microseconds>( end_time - start_time ).count() / float(1000000);
	muses.push_back(MUS(mus, duration, muses.size(), f_size));
	return muses.back();
}

//grow formula into a MSS
Formula Master::grow_formula(Formula &f){
	return satSolver->grow(f);
}

void Master::mark_MUS(MUS& f, bool block_unex){	
	if(validate_mus_c) validate_mus(f.bool_mus);		
	explorer->block_up(f);

	chrono::high_resolution_clock::time_point now = chrono::high_resolution_clock::now();
	auto duration = chrono::duration_cast<chrono::microseconds>( now - initial_time ).count() / float(1000000);
        cout << "Found MUS #" << muses.size() <<  ", mus dimension: " << f.dimension;
	cout << ", checks: " << satSolver->checks << ", time: " << duration;
	cout << ", unex sat: " << unex_sat << ", unex unsat: " << unex_unsat << ", criticals: " << explorer->criticals;
	cout << ", intersections: " << std::count(explorer->mus_intersection.begin(), explorer->mus_intersection.end(), true);
	cout << ", union: " << std::count(explorer->mus_union.begin(), explorer->mus_union.end(), true) << ", dimension: " << dimension;
	cout << ", seed dimension: " << f.seed_dimension << ", shrink duration: " << f.duration;
	cout << ", shrinks: " << satSolver->shrinks;
	cout << endl;

	if(false && output_file != "")
		write_mus_to_file(f);
}

void Master::mark_MSS(Formula& f, bool block){
	explorer->block_down(f);
	Formula mcs = complement(f);
	mcses.push_back(mcs);
	chrono::high_resolution_clock::time_point now = chrono::high_resolution_clock::now();
	auto duration = chrono::duration_cast<chrono::microseconds>( now - initial_time ).count() / float(1000000);
        cout << "Found MCS #" << mcses.size() <<  ", mcs dimension: " << count_ones(mcs);
	cout << ", checks: " << satSolver->checks << ", time: " << duration;
	cout << endl;

	if(output_file != "")
		satSolver->exportMCS(mcs, output_file);
}



void Master::enumerate(){
	initial_time = chrono::high_resolution_clock::now();
	cout << "running algorithm: " << algorithm << endl;
	Formula whole(dimension, true);
	if(is_valid(whole))
		print_err("the input instance is satisfiable");

	if(algorithm == "remus"){
		find_all_muses_duality_based_remus(Formula (dimension, true), Formula (dimension, false), 0);
	}
	else if(algorithm == "tome"){
		find_all_muses_tome();
	}
	else if(algorithm == "marco"){
		marco_base();
	}
	else if(algorithm == "tamus"){
		tamus();
	}
	return;
}

