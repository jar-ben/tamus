# Tamus
Tamus is a tool for relaxing timed automata for reachability properties. The input is a timed automata A and a set of states of A that are not reachable in A, and the ouput is an automaton A' that originates from A by only relaxing simple clock constraints (of guards and invariants) and in which the target set of states is reachable.  
Each simple clock constraint is an inequivality of the form x - y ~ c where x, y are clocks, c is an integer, and ~ is either <=, <, >, or >=. The relaxation is done by increasing/descreasing the value of c. For example, a constraint x - y <= 5 can be relaxed to x - y <= 10. 
The automaton A' found by Tamus originates from A by relaxing only the minimum necessary number of simple clock constraints, and, moreover, the total change to these constraints (difference of the constants c) is minimized.  


## Installation
TBA

## Running Tamus
```
python2 ./tamus.py <input_model_file> <input_query_file>
```

The input model and query files are in the xml-uppaal compliant format. See the examples in the folder ./examples/. 
For instance, run `python2 tamus.py examples/example_TA.xml examples/example_TA.q`. Note that due to dependencies on third-party libraries that we use, you need to run Tamus with python2. 

## Copyright Note
This tool has been developed by Jaroslav Bendik, Ahmet Sencan, and Ebru Aydin Gol. We distribute it under the ... lincence. 

## Citing
A paper describing Tamus is currently under a conference review process. We will provide a reference to the paper at the time of acceptance.


## Contact
In case of any troubles, do not hesitate to contact us at xbendik=at=gmail.com.
