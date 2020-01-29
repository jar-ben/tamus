#include "TAHandle.h"
#include <algorithm>
#include <sstream>
#include <iostream>
#include <fstream>
#include <random>
#include "core/misc.h"


bool is_number(const std::string& s)
{
   	return !s.empty() && std::find_if(s.begin(), 
        s.end(), [](unsigned char c) { return !std::isdigit(c); }) == s.end();
}

std::vector<int> path_lengths(const std::string& str){
	std::stringstream ss(str);
	std::string token;
	int c = 0;
	std::vector<int> paths;
	while(std::getline(ss, token, ' ')){
		if(c++ > 0 && is_number(token))
			paths.push_back(std::stoi(token));
	}
	return paths;
}


TAHandle::TAHandle(std::string filename): SatSolver(filename){
	model = filename;
	std::string cmd = "python2 ../main.py " + filename + " init";
	std::cout << cmd << std::endl;
	std::string res = exec(cmd.c_str());
	std::string line;
	std::istringstream stream{res};
	while (std::getline(stream, line)){
		if(starts_with(line, "paths:")){
			paths = path_lengths(line);
			break;
		}
	}
	dimension = paths[0];
}


std::string TAHandle::toString(std::vector<bool> &f){	
	std::string result = "";
	for(int i = 0; i < dimension; i++)
		result += (f[i]) ? "1" : "0";
	return result;
}

// check formula for satisfiability
// the core and grow variables controls whether to return an unsat core or model extension, respectively
bool TAHandle::solve(std::vector<bool> &formula, bool core, bool grow){
	std::string active = "";
	for(int i = 0; i < dimension; i++)
		active += (formula[i])? "1" : "0";
	std::string cmd = "python2 ./uppaalHelpers/main.py " + model + " check 0 " + active;
	std::string res = exec(cmd.c_str());
	trim(res);
	return res == "1";
}

TAHandle::~TAHandle(){
}

