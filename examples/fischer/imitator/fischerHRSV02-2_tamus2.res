(************************************************************
 * Result output by IMITATOR
 * Version  : IMITATOR 2.12.1 "Butter Lobster" (build 3061)
 * Git      : master/4e8b1c8
 * Model    : 'benchmarks/Fischer/fischerHRSV02-2_tamus.imi'
 * Generated: Wed Sep 16, 2020 22:02:23
 * Command  : ./bin/imitator benchmarks/Fischer/fischerHRSV02-2_tamus.imi -mode EFunsafe -incl -output-result -time-limit 1200 -counterexample
 ************************************************************)


------------------------------------------------------------
Number of IPTAs                         : 2
Number of clocks                        : 2
Has stopwatches?                        : false
L/U subclass                            : U-PTA
Has silent actions?                     : true
Is strongly deterministic?              : true
Number of parameters                    : 16
Number of discrete variables            : 1
Number of actions                       : 14
Total number of locations               : 8
Average locations per IPTA              : 4.0
Total number of transitions             : 14
Average transitions per IPTA            : 7.0
------------------------------------------------------------

BEGIN CONSTRAINT
 p6 >= 0
& p4 >= 0
& p14 >= 0
& p10 >= 0
& p4 + p5 + p6 + p9 + p10 > 1
& p5 >= 0
& p9 >= 0
& p6 + p10 > 1
& p15 >= 0
& p13 >= 0
& p12 >= 0
& p11 >= 0
& p8 >= 0
& p7 >= 0
& p3 >= 0
& p2 >= 0
& p1 >= 0
& p0 >= 0
END CONSTRAINT

------------------------------------------------------------
Constraint soundness                    : possible under-approximation
Termination                             : terminated after reaching a target state (some states may have been unexplored)
Constraint nature                       : good
------------------------------------------------------------
Number of states                        : 66
Number of transitions                   : 68
Number of computed states               : 69
Total computation time                  : 0.204 second
States/second in state space            : 322.5 (66/0.204 second)
Computed states/second                  : 337.2 (69/0.204 second)
Estimated memory                        : 4.651 MiB (i.e., 609637 words of size 8)
------------------------------------------------------------

------------------------------------------------------------
 Statistics: Algorithm counters
------------------------------------------------------------
main algorithm + parsing                : 0.210 second
main algorithm                          : 0.204 second
------------------------------------------------------------
 Statistics: Parsing counters
------------------------------------------------------------
model parsing and converting            : 0.006 second
------------------------------------------------------------
 Statistics: State computation counters
------------------------------------------------------------
number of state comparisons             : 305
number of constraints comparisons       : 134
number of new states <= old             : 3
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
total                                   : 0.211 second
------------------------------------------------------------