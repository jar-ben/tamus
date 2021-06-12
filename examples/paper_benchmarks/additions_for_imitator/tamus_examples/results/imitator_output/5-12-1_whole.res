(************************************************************
 * Result by: IMITATOR 3.1-beta "Cheese Artichoke" (build master/e4be7d7)
 * Model    : 'tamus_examples/generator_examples/5/5-12-1.imi'
 * Generated: Tue Jun 8, 2021 05:18:50
 * Command  : imitator tamus_examples/generator_examples/5/5-12-1.imi tamus_examples/generator_examples/5/5-12-1.imiprop
 ************************************************************)


------------------------------------------------------------
Number of IPTAs                         : 1
Number of clocks                        : 5
Has invariants?                         : true
Has clocks with rate <>1?               : false
L/U subclass                            : U-PTA
Has silent actions?                     : false
Is strongly deterministic?              : true
Number of parameters                    : 16
Number of discrete variables            : 0
Number of actions                       : 13
Total number of locations               : 14
Average locations per IPTA              : 14.0
Total number of transitions             : 13
Average transitions per IPTA            : 13.0
------------------------------------------------------------

BEGIN CONSTRAINT
 p0 + p1 + p2 + p6 + p8 + p9 + p14 + p15 >= 4
& p1 + p3 + p6 + p8 + p9 + p14 + p15 >= 3
& p3 + p4 + p8 + p10 + p11 >= 3
& p1 + p3 + p5 + p6 >= 2
& p7 >= 0
& p0 + p1 + p2 + p5 + p6 >= 3
& p0 >= 0
& p3 >= 0
& p0 + p2 + p4 + p5 + p7 + p10 + p11 >= 5
& p1 + p3 + p6 + p8 + p9 + p10 + p13 + p15 >= 4
& p3 + p4 + p5 + p7 + p10 + p11 >= 4
& p0 + p2 + p4 + p8 + p10 + p11 >= 4
& p5 >= 0
& p2 >= 0
& p0 + p1 + p2 + p6 + p8 + p9 + p10 + p13 + p15 >= 5
& p8 >= 0
& p7 + p9 + p14 + p15 >= 2
& p7 + p9 + p10 + p13 + p15 >= 3
& p10 >= 0
& p13 >= 0
& p14 >= 0
& p15 >= 0
& p11 >= 0
& p9 >= 0
& p6 >= 0
& p4 >= 0
& p1 >= 0
& p12 >= 0
END CONSTRAINT

------------------------------------------------------------
Constraint soundness                    : exact
Termination                             : regular termination
Constraint nature                       : good
------------------------------------------------------------
Number of states                        : 14
Number of transitions                   : 13
Number of computed states               : 14
Total computation time                  : 80.524 seconds
States/second in state space            : 0.1 (14/80.524 seconds)
Computed states/second                  : 0.1 (14/80.524 seconds)
Estimated memory                        : 2.757 MiB (i.e., 361407 words of size 8)
------------------------------------------------------------

------------------------------------------------------------
 Statistics: Algorithm counters
------------------------------------------------------------
main algorithm + parsing                : 80.530 seconds
main algorithm                          : 80.524 seconds
------------------------------------------------------------
 Statistics: Parsing counters
------------------------------------------------------------
model parsing and converting            : 0.006 second
------------------------------------------------------------
 Statistics: State computation counters
------------------------------------------------------------
number of state comparisons             : 0
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
total                                   : 82.257 seconds
------------------------------------------------------------