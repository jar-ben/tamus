(************************************************************
 * Result by: IMITATOR 3.1-beta "Cheese Artichoke" (build master/e4be7d7)
 * Model    : 'tamus_examples/generator_examples/3/3-18-1.imi'
 * Generated: Tue Jun 8, 2021 02:10:36
 * Command  : imitator tamus_examples/generator_examples/3/3-18-1.imi tamus_examples/generator_examples/3/3-18-1_witness.imiprop
 ************************************************************)


------------------------------------------------------------
Number of IPTAs                         : 1
Number of clocks                        : 3
Has invariants?                         : true
Has clocks with rate <>1?               : false
L/U subclass                            : U-PTA
Has silent actions?                     : false
Is strongly deterministic?              : true
Number of parameters                    : 16
Number of discrete variables            : 0
Number of actions                       : 19
Total number of locations               : 20
Average locations per IPTA              : 20.0
Total number of transitions             : 19
Average transitions per IPTA            : 19.0
------------------------------------------------------------

BEGIN CONSTRAINT
 p0 + p1 + p2 + p3 + p4 >= 3
& p0 >= 0
& p3 >= 0
& p2 >= 0
& p5 + p6 + p7 + p8 + p9 >= 3
& p5 >= 0
& p8 >= 0
& p7 >= 0
& p10 + p11 + p12 + p14 + p15 >= 3
& p10 >= 0
& p14 >= 0
& p12 >= 0
& p11 >= 0
& p15 >= 0
& p6 >= 0
& p9 >= 0
& p1 >= 0
& p4 >= 0
& p13 >= 0
END CONSTRAINT

------------------------------------------------------------
Constraint soundness                    : possible under-approximation
Termination                             : terminated after reaching a target state (some states may have been unexplored)
Constraint nature                       : good
------------------------------------------------------------
Number of states                        : 20
Number of transitions                   : 19
Number of computed states               : 20
Total computation time                  : 67.609 seconds
States/second in state space            : 0.2 (20/67.609 seconds)
Computed states/second                  : 0.2 (20/67.609 seconds)
Estimated memory                        : 2.793 MiB (i.e., 366122 words of size 8)
------------------------------------------------------------

------------------------------------------------------------
 Statistics: Algorithm counters
------------------------------------------------------------
main algorithm + parsing                : 67.617 seconds
main algorithm                          : 67.609 seconds
------------------------------------------------------------
 Statistics: Parsing counters
------------------------------------------------------------
model parsing and converting            : 0.007 second
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
total                                   : 67.647 seconds
------------------------------------------------------------