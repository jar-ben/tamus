#include <string>
#include <map>
#include <vector>
#include "SatSolver.h"



class TAHandle: public SatSolver{
public:
	std::string model;
	std::vector<int> paths;
	TAHandle(std::string);
	~TAHandle();
	bool solve(std::vector<bool> &formula, bool core = false, bool grow = false);
	std::string toString(std::vector<bool> &mus);
};
