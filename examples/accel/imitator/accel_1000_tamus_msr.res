(************************************************************
 * Result output by IMITATOR
 * Version  : IMITATOR 2.12.1 "Butter Lobster" (build 3061)
 * Git      : master/4e8b1c8
 * Model    : 'benchmarks/PTPM/accel_1000_tamus_msr.imi'
 * Generated: Tue Sep 15, 2020 13:39:06
 * Command  : ./bin/imitator benchmarks/PTPM/accel_1000_tamus_msr.imi -mode EFunsafe -incl -output-result -time-limit 1200
 ************************************************************)


------------------------------------------------------------
Number of IPTAs                         : 2
Number of clocks                        : 2
Has stopwatches?                        : false
L/U subclass                            : U-PTA
Has silent actions?                     : true
Is strongly deterministic?              : true
Number of parameters                    : 2
Number of discrete variables            : 0
Number of actions                       : 11
Total number of locations               : 2574
Average locations per IPTA              : 1287.0
Total number of transitions             : 2592
Average transitions per IPTA            : 1296.0
------------------------------------------------------------

BEGIN CONSTRAINT
 p1 >= 2950
& p2 >= 2900
END CONSTRAINT

------------------------------------------------------------
Constraint soundness                    : exact
Termination                             : regular termination
Constraint nature                       : good
------------------------------------------------------------
Number of states                        : 4261
Number of transitions                   : 4260
Number of computed states               : 4261
Total computation time                  : 1.600 seconds
States/second in state space            : 2662.1 (4261/1.600 seconds)
Computed states/second                  : 2662.1 (4261/1.600 seconds)
Estimated memory                        : 605.376 MiB (i.e., 79347919 words of size 8)
------------------------------------------------------------

------------------------------------------------------------
 Statistics: Algorithm counters
------------------------------------------------------------
main algorithm + parsing                : 2.089 seconds
main algorithm                          : 1.600 seconds
------------------------------------------------------------
 Statistics: Parsing counters
------------------------------------------------------------
model parsing and converting            : 0.488 second
------------------------------------------------------------
 Statistics: State computation counters
------------------------------------------------------------
number of state comparisons             : 2085
number of constraints comparisons       : 0
number of new states <= old             : 0
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
total                                   : 2.089 seconds
------------------------------------------------------------