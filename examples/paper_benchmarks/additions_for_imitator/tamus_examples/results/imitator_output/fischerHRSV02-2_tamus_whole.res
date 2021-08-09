(************************************************************
 * Result by: IMITATOR 3.1-beta "Cheese Artichoke" (build master/e4be7d7)
 * Model    : 'tamus_examples/fischer/fischerHRSV02-2_tamus.imi'
 * Generated: Mon Jun 7, 2021 19:36:23
 * Command  : imitator tamus_examples/fischer/fischerHRSV02-2_tamus.imi tamus_examples/fischer/fischerHRSV02-2_tamus_witness.imiprop
 ************************************************************)


------------------------------------------------------------
Number of IPTAs                         : 2
Number of clocks                        : 2
Has invariants?                         : true
Has clocks with rate <>1?               : false
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
Number of states                        : 42
Number of transitions                   : 46
Number of computed states               : 55
Total computation time                  : 0.157 second
States/second in state space            : 266.0 (42/0.157 second)
Computed states/second                  : 348.3 (55/0.157 second)
Estimated memory                        : 3.535 MiB (i.e., 463351 words of size 8)
------------------------------------------------------------

------------------------------------------------------------
 Statistics: Algorithm counters
------------------------------------------------------------
main algorithm + parsing                : 0.163 second
main algorithm                          : 0.157 second
------------------------------------------------------------
 Statistics: Parsing counters
------------------------------------------------------------
model parsing and converting            : 0.005 second
------------------------------------------------------------
 Statistics: State computation counters
------------------------------------------------------------
number of state comparisons             : 86
number of constraints comparisons       : 86
number of new states <= old             : 0
number of new states >= old             : 0
StateSpace.merging attempts             : 68
StateSpace.merges                       : 7
------------------------------------------------------------
 Statistics: Graphics-related counters
------------------------------------------------------------
state space drawing                     : 0.000 second
------------------------------------------------------------
 Statistics: Global counter
------------------------------------------------------------
total                                   : 0.164 second
------------------------------------------------------------