#include <string>
#include <map>
#include <vector>
#include "SatSolver.h"



class TAHandle: public SatSolver{
public:
	std::string location;
	std::string model;
	std::vector<int> paths;
	TAHandle(std::string mod, std::string loc);
	~TAHandle();
	bool solve(std::vector<bool> &formula, bool core = false, bool grow = false);
	std::string toString(std::vector<bool> &mus);
};
