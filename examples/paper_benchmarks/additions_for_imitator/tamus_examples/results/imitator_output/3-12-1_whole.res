(************************************************************
 * Result by: IMITATOR 3.1-beta "Cheese Artichoke" (build master/e4be7d7)
 * Model    : 'tamus_examples/generator_examples/3/3-12-1.imi'
 * Generated: Tue Jun 8, 2021 02:08:21
 * Command  : imitator tamus_examples/generator_examples/3/3-12-1.imi tamus_examples/generator_examples/3/3-12-1.imiprop
 ************************************************************)


------------------------------------------------------------
Number of IPTAs                         : 1
Number of clocks                        : 3
Has invariants?                         : true
Has clocks with rate <>1?               : false
L/U subclass                            : U-PTA
Has silent actions?                     : false
Is strongly deterministic?              : true
Number of parameters                    : 11
Number of discrete variables            : 0
Number of actions                       : 13
Total number of locations               : 14
Average locations per IPTA              : 14.0
Total number of transitions             : 13
Average transitions per IPTA            : 13.0
------------------------------------------------------------

BEGIN CONSTRAINT
 p0 + p1 + p2 + p3 + p4 >= 3
& p0 >= 0
& p3 >= 0
& p2 >= 0
& p5 + p6 + p7 + p9 + p10 >= 3
& p5 >= 0
& p9 >= 0
& p7 >= 0
& p6 >= 0
& p10 >= 0
& p1 >= 0
& p4 >= 0
& p8 >= 0
END CONSTRAINT

------------------------------------------------------------
Constraint soundness                    : exact
Termination                             : regular termination
Constraint nature                       : good
------------------------------------------------------------
Number of states                        : 14
Number of transitions                   : 13
Number of computed states               : 14
Total computation time                  : 0.134 second
States/second in state space            : 103.7 (14/0.134 second)
Computed states/second                  : 103.7 (14/0.134 second)
Estimated memory                        : 2.409 MiB (i.e., 315759 words of size 8)
------------------------------------------------------------

------------------------------------------------------------
 Statistics: Algorithm counters
------------------------------------------------------------
main algorithm + parsing                : 0.140 second
main algorithm                          : 0.135 second
------------------------------------------------------------
 Statistics: Parsing counters
------------------------------------------------------------
model parsing and converting            : 0.005 second
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
total                                   : 0.142 second
------------------------------------------------------------