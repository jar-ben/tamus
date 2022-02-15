# Tamus
Tamus is a tool for relaxing timed automata for reachability properties. The input is a timed automata A and a set of states of A that are not reachable in A, and the ouput is an automaton A' that originates from A by only relaxing simple clock constraints (of guards and invariants) and in which the target set of states is reachable.  
Each simple clock constraint is an inequivality of the form x - y ~ c where x, y are clocks, c is an integer, and ~ is either <=, <, >, or >=. The relaxation is done by increasing/descreasing the value of c. For example, a constraint x - y <= 5 can be relaxed to x - y <= 10. 
The automaton A' found by Tamus originates from A by relaxing only the minimum necessary number of simple clock constraints, and, moreover, the total change to these constraints (difference of the constants c) is minimized.  


## Installation
Tamus requires several external libraries to be installed. 
- First, you need python2 to run Tamus (due to dependencies on third-party libraries that we use)
- Second, you need to install the z3 solver with python bindings enabled. You can download z3 and install it from here: https://github.com/Z3Prover/z3. Do not forget to use "--python" with python scripts/mk_make.py, and also make sure that you install the python bindings, e.g., with "pip install z3-solver"
- Third, you need to install networkx. "pip install networkx" should do the trick. Follow instructions at https://networkx.github.io/documentation/stable/install.html for further details.
- Fourth, you need to install the or-tools from https://developers.google.com/optimization/install
- Finally, you need to download uppaal from http://www.uppaal.org/. Once you download it, make sure that you add to the system $PATH the path to the binary "verifyta" that is located at uppaal-<version_number>/bin-Linux. Make sure that verifyta works by running "verifyta -t1  -o0 -S1 -q examples/example_TA.xml examples/example_TA.q" in the main directory of Tamus. There is a solid chance that it will trow this error: "Internet connection is required for activation.". In such case, follow instructions at https://www.it.uu.se/research/group/darts/uppaal/documentation.shtml. In our case (Ubuntu 18.04 LTS, 64 bit), the following did the trick: "sudo apt-get update -y; sudo apt-get install -y libc6-i386"



## Running Tamus
```
python2 ./tamus.py --task <task> <input_model_file> <input_query_file> <template_name>
```
The input model and query files are in the xml-uppaal compliant format. See the examples in the folder ./examples/. 
The template name can be either "All" or the name of one of the templates from the input model. When "All" is chosen, computation will be done on all templates.
For instance, run `python2 tamus.py --task mmsr examples/example_TA.xml examples/example_TA.q TA`. 
The option `--task` is used to choose the computation task; the available options are the following:

- `--task mmsr` identifies a minimum minimal sufficient reduction
- `--task amsr` identifies all minimal sufficient reductions,
- `--task mmg` identifies a minimum minimal guarantee,
- `--task amg` identifies all minimal guarantees

## Copyright Note
This tool has been developed by Jaroslav Bendik, Ahmet Sencan, Ebru Aydin Gol, and Ivana Cerna. We distribute it under the GPL-3.0 License (see the LICENSE file). 

## Citing
If you use Tamus, please, cite the following paper:
```
@inproceedings{DBLP:conf/tacas/BendikSGC21,
  author    = {Jaroslav Bend{\'{\i}}k and
               Ahmet Sencan and
               Ebru Aydin Gol and
               Ivana Cern{\'{a}}},
  title     = {Timed Automata Relaxation for Reachability},
  booktitle = {{TACAS} {(1)}},
  series    = {Lecture Notes in Computer Science},
  volume    = {12651},
  pages     = {291--310},
  publisher = {Springer},
  year      = {2021}
}
```

## Contact
In case of any troubles, do not hesitate to contact us at xbendik=at=gmail.com.
