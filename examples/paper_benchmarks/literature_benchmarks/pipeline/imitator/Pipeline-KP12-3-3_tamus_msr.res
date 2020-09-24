(************************************************************
 * Result output by IMITATOR
 * Version  : IMITATOR 2.12.1 "Butter Lobster" (build 3061)
 * Git      : master/4e8b1c8
 * Model    : 'benchmarks/ProdCons/Pipeline-KP12-3-3_tamus_msr.imi'
 * Generated: Wed Sep 16, 2020 11:26:48
 * Command  : ./bin/imitator benchmarks/ProdCons/Pipeline-KP12-3-3_tamus_msr.imi -mode EFunsafe -incl -output-result -time-limit 1200
 ************************************************************)


------------------------------------------------------------
Number of IPTAs                         : 6
Number of clocks                        : 6
Has stopwatches?                        : false
L/U subclass                            : U-PTA
Has silent actions?                     : true
Is strongly deterministic?              : true
Number of parameters                    : 1
Number of discrete variables            : 0
Number of actions                       : 16
Total number of locations               : 21
Average locations per IPTA              : 3.5
Total number of transitions             : 20
Average transitions per IPTA            : 3.3
------------------------------------------------------------

BEGIN CONSTRAINT
 p0 >= 2
END CONSTRAINT

------------------------------------------------------------
Constraint soundness                    : exact
Termination                             : regular termination
Constraint nature                       : good
------------------------------------------------------------
Number of states                        : 69
Number of transitions                   : 78
Number of computed states               : 79
Total computation time                  : 0.059 second
States/second in state space            : 1166.4 (69/0.059 second)
Computed states/second                  : 1335.5 (79/0.059 second)
Estimated memory                        : 4.199 MiB (i.e., 550391 words of size 8)
------------------------------------------------------------

------------------------------------------------------------
 Statistics: Algorithm counters
------------------------------------------------------------
main algorithm + parsing                : 0.086 second
main algorithm                          : 0.064 second
------------------------------------------------------------
 Statistics: Parsing counters
------------------------------------------------------------
model parsing and converting            : 0.015 second
------------------------------------------------------------
 Statistics: State computation counters
------------------------------------------------------------
number of state comparisons             : 158
number of constraints comparisons       : 108
number of new states <= old             : 10
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
total                                   : 0.086 second
------------------------------------------------------------