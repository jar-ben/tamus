(************************************************************
 * Result output by IMITATOR
 * Version  : IMITATOR 2.12.1 "Butter Lobster" (build 3061)
 * Git      : master/4e8b1c8
 * Model    : 'benchmarks/SIMOP/simop3_tamus_msr.imi'
 * Generated: Wed Sep 16, 2020 22:00:06
 * Command  : ./bin/imitator benchmarks/SIMOP/simop3_tamus_msr.imi -mode EFunsafe -incl -output-result -time-limit 1200 -counterexample
 ************************************************************)


------------------------------------------------------------
Number of IPTAs                         : 5
Number of clocks                        : 8
Has stopwatches?                        : false
L/U subclass                            : U-PTA
Has silent actions?                     : true
Is strongly deterministic?              : true
Number of parameters                    : 6
Number of discrete variables            : 0
Number of actions                       : 25
Total number of locations               : 46
Average locations per IPTA              : 9.2
Total number of transitions             : 72
Average transitions per IPTA            : 14.4
------------------------------------------------------------

BEGIN CONSTRAINT
 p1 >= 4
& p3 >= 10
& p2 >= 4
& p0 + p3 + p4 >= 3711
& p0 >= 2001
& p3 + p4 >= 1640
& p5 >= 28
& p2 + p3 + p4 >= 1652
& p0 + p4 >= 3681
& p0 + p2 + p4 >= 3693
& p4 >= 1610
& p2 + p4 >= 1622
& p0 + p2 + p3 + p4 >= 3723
END CONSTRAINT

------------------------------------------------------------
Constraint soundness                    : possible under-approximation
Termination                             : terminated after reaching a target state (some states may have been unexplored)
Constraint nature                       : good
------------------------------------------------------------
Number of states                        : 50
Number of transitions                   : 58
Number of computed states               : 59
Total computation time                  : 0.477 second
States/second in state space            : 104.8 (50/0.477 second)
Computed states/second                  : 123.6 (59/0.477 second)
Estimated memory                        : 5.055 MiB (i.e., 662656 words of size 8)
------------------------------------------------------------

------------------------------------------------------------
 Statistics: Algorithm counters
------------------------------------------------------------
main algorithm + parsing                : 0.495 second
main algorithm                          : 0.477 second
------------------------------------------------------------
 Statistics: Parsing counters
------------------------------------------------------------
model parsing and converting            : 0.018 second
------------------------------------------------------------
 Statistics: State computation counters
------------------------------------------------------------
number of state comparisons             : 87
number of constraints comparisons       : 48
number of new states <= old             : 9
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
total                                   : 0.496 second
------------------------------------------------------------