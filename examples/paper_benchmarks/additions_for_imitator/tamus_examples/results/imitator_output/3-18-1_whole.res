(************************************************************
 * Result by: IMITATOR 3.1-beta "Cheese Artichoke" (build master/e4be7d7)
 * Model    : 'tamus_examples/generator_examples/3/3-18-1.imi'
 * Generated: Tue Aug 10, 2021 02:35:05
 * Command  : imitator tamus_examples/generator_examples/3/3-18-1.imi tamus_examples/generator_examples/3/3-18-1.imiprop
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
Constraint soundness                    : exact
Termination                             : regular termination
Constraint nature                       : good
------------------------------------------------------------
Number of states                        : 20
Number of transitions                   : 19
Number of computed states               : 20
Total computation time                  : 62.836 seconds
States/second in state space            : 0.3 (20/62.836 seconds)
Computed states/second                  : 0.3 (20/62.836 seconds)
Estimated memory                        : 2.785 MiB (i.e., 365074 words of size 8)
------------------------------------------------------------

------------------------------------------------------------
 Statistics: Algorithm counters
------------------------------------------------------------
main algorithm + parsing                : 62.840 seconds
main algorithm                          : 62.836 seconds
------------------------------------------------------------
 Statistics: Parsing counters
------------------------------------------------------------
model parsing and converting            : 0.004 second
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
total                                   : 62.860 seconds
------------------------------------------------------------