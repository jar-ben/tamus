(************************************************************
 * Result output by IMITATOR
 * Version  : IMITATOR 2.12.1 "Butter Lobster" (build 3061)
 * Git      : master/4e8b1c8
 * Model    : 'benchmarks/NuclearPlant/NuclearPlant_tamus-msr.imi'
 * Generated: Mon Sep 14, 2020 21:16:13
 * Command  : ./bin/imitator benchmarks/NuclearPlant/NuclearPlant_tamus-msr.imi -mode EFunsafe -incl -output-result -time-limit 1200
 ************************************************************)


------------------------------------------------------------
Number of IPTAs                         : 1
Number of clocks                        : 2
Has stopwatches?                        : false
L/U subclass                            : U-PTA
Has silent actions?                     : false
Is strongly deterministic?              : true
Number of parameters                    : 1
Number of discrete variables            : 0
Number of actions                       : 6
Total number of locations               : 6
Average locations per IPTA              : 6.0
Total number of transitions             : 8
Average transitions per IPTA            : 8.0
------------------------------------------------------------

BEGIN CONSTRAINT
 p5 >= 8
END CONSTRAINT

------------------------------------------------------------
Constraint soundness                    : exact
Termination                             : regular termination
Constraint nature                       : good
------------------------------------------------------------
Number of states                        : 6
Number of transitions                   : 6
Number of computed states               : 7
Total computation time                  : 0.002 second
States/second in state space            : 2840.7 (6/0.002 second)
Computed states/second                  : 3314.1 (7/0.002 second)
Estimated memory                        : 2.142 MiB (i.e., 280874 words of size 8)
------------------------------------------------------------

------------------------------------------------------------
 Statistics: Algorithm counters
------------------------------------------------------------
main algorithm + parsing                : 0.003 second
main algorithm                          : 0.002 second
------------------------------------------------------------
 Statistics: Parsing counters
------------------------------------------------------------
model parsing and converting            : 0.001 second
------------------------------------------------------------
 Statistics: State computation counters
------------------------------------------------------------
number of state comparisons             : 1
number of constraints comparisons       : 1
number of new states <= old             : 1
number of new states >= old             : 0
StateSpace.merging attempts             : 0
StateSpace.merges                       : 0
------------------------------------------------------------
 Statistics: Graphics-related counters
------------------------------------------------------------
state space drawing                     : 0.000 second
------------------------------------------------------------
 Statistics: Global counter
------------------------------------------------------------
total                                   : 0.003 second
------------------------------------------------------------