(************************************************************
 * Result by: IMITATOR 3.1-beta "Cheese Artichoke" (build master/e4be7d7)
 * Model    : 'tamus_examples/simop/simop3_tamus_msr.imi'
 * Generated: Tue Aug 10, 2021 02:33:31
 * Command  : imitator tamus_examples/simop/simop3_tamus_msr.imi tamus_examples/simop/simop3_tamus_witness.imiprop
 ************************************************************)


------------------------------------------------------------
Number of IPTAs                         : 5
Number of clocks                        : 8
Has invariants?                         : true
Has clocks with rate <>1?               : false
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
Number of states                        : 32
Number of transitions                   : 40
Number of computed states               : 41
Total computation time                  : 0.347 second
States/second in state space            : 92.0 (32/0.347 second)
Computed states/second                  : 117.9 (41/0.347 second)
Estimated memory                        : 4.552 MiB (i.e., 596765 words of size 8)
------------------------------------------------------------

------------------------------------------------------------
 Statistics: Algorithm counters
------------------------------------------------------------
main algorithm + parsing                : 0.354 second
main algorithm                          : 0.347 second
------------------------------------------------------------
 Statistics: Parsing counters
------------------------------------------------------------
model parsing and converting            : 0.006 second
------------------------------------------------------------
 Statistics: State computation counters
------------------------------------------------------------
number of state comparisons             : 15
number of constraints comparisons       : 15
number of new states <= old             : 0
number of new states >= old             : 0
StateSpace.merging attempts             : 10
StateSpace.merges                       : 9
------------------------------------------------------------
 Statistics: Graphics-related counters
------------------------------------------------------------
state space drawing                     : 0.000 second
------------------------------------------------------------
 Statistics: Global counter
------------------------------------------------------------
total                                   : 0.355 second
------------------------------------------------------------