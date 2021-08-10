(************************************************************
 * Result by: IMITATOR 3.1-beta "Cheese Artichoke" (build master/e4be7d7)
 * Model    : 'tamus_examples/jobshop/maler_4_4_tamus_msr.imi'
 * Generated: Tue Aug 10, 2021 00:52:52
 * Command  : imitator tamus_examples/jobshop/maler_4_4_tamus_msr.imi tamus_examples/jobshop/maler_4_4_tamus_witness.imiprop
 ************************************************************)


------------------------------------------------------------
Number of IPTAs                         : 4
Number of clocks                        : 4
Has invariants?                         : true
Has clocks with rate <>1?               : false
L/U subclass                            : U-PTA
Has silent actions?                     : false
Is strongly deterministic?              : true
Number of parameters                    : 5
Number of discrete variables            : 4
Number of actions                       : 4
Total number of locations               : 36
Average locations per IPTA              : 9.0
Total number of transitions             : 32
Average transitions per IPTA            : 8.0
------------------------------------------------------------

BEGIN CONSTRAINT
 p2 >= 1
& p0 >= 1
& p4 >= 1
& p3 >= 1
& p1 >= 1
END CONSTRAINT

------------------------------------------------------------
Constraint soundness                    : possible under-approximation
Termination                             : terminated after reaching a target state (some states may have been unexplored)
Constraint nature                       : good
------------------------------------------------------------
Number of states                        : 17285
Number of transitions                   : 39628
Number of computed states               : 39629
Total computation time                  : 301.026 seconds
States/second in state space            : 57.4 (17285/301.026 seconds)
Computed states/second                  : 131.6 (39629/301.026 seconds)
Estimated memory                        : 56.746 GiB (i.e., 7616432901 words of size 8)
------------------------------------------------------------

------------------------------------------------------------
 Statistics: Algorithm counters
------------------------------------------------------------
main algorithm + parsing                : 301.031 seconds
main algorithm                          : 301.026 seconds
------------------------------------------------------------
 Statistics: Parsing counters
------------------------------------------------------------
model parsing and converting            : 0.004 second
------------------------------------------------------------
 Statistics: State computation counters
------------------------------------------------------------
number of state comparisons             : 440497
number of constraints comparisons       : 440497
number of new states <= old             : 6985
number of new states >= old             : 0
StateSpace.merging attempts             : 476797
StateSpace.merges                       : 15359
------------------------------------------------------------
 Statistics: Graphics-related counters
------------------------------------------------------------
state space drawing                     : 0.000 second
------------------------------------------------------------
 Statistics: Global counter
------------------------------------------------------------
total                                   : 301.031 seconds
------------------------------------------------------------