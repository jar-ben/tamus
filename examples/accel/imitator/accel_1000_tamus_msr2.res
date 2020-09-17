(************************************************************
 * Result output by IMITATOR
 * Version  : IMITATOR 2.12.1 "Butter Lobster" (build 3061)
 * Git      : master/4e8b1c8
 * Model    : 'benchmarks/PTPM/accel_1000_tamus_msr.imi'
 * Generated: Wed Sep 16, 2020 18:55:21
 * Command  : ./bin/imitator benchmarks/PTPM/accel_1000_tamus_msr.imi -mode EFunsafe -incl -output-result -time-limit 1200 -counterexample
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
Constraint soundness                    : possible under-approximation
Termination                             : terminated after reaching a target state (some states may have been unexplored)
Constraint nature                       : good
------------------------------------------------------------
Number of states                        : 1488
Number of transitions                   : 1487
Number of computed states               : 1488
Total computation time                  : 0.583 second
States/second in state space            : 2552.1 (1488/0.583 second)
Computed states/second                  : 2552.1 (1488/0.583 second)
Estimated memory                        : 560.030 MiB (i.e., 73404308 words of size 8)
------------------------------------------------------------

------------------------------------------------------------
 Statistics: Algorithm counters
------------------------------------------------------------
main algorithm + parsing                : 1.033 seconds
main algorithm                          : 0.583 second
------------------------------------------------------------
 Statistics: Parsing counters
------------------------------------------------------------
model parsing and converting            : 0.450 second
------------------------------------------------------------
 Statistics: State computation counters
------------------------------------------------------------
number of state comparisons             : 16
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
total                                   : 1.033 seconds
------------------------------------------------------------