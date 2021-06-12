(************************************************************
 * Result by: IMITATOR 3.1-beta "Cheese Artichoke" (build master/e4be7d7)
 * Model    : 'tamus_examples/fischer/fischerHRSV02-2_tamus_msr.imi'
 * Generated: Mon Jun 7, 2021 19:36:53
 * Command  : imitator tamus_examples/fischer/fischerHRSV02-2_tamus_msr.imi tamus_examples/fischer/fischerHRSV02-2_tamus_witness.imiprop
 ************************************************************)


------------------------------------------------------------
Number of IPTAs                         : 2
Number of clocks                        : 2
Has invariants?                         : true
Has clocks with rate <>1?               : false
L/U subclass                            : U-PTA
Has silent actions?                     : true
Is strongly deterministic?              : true
Number of parameters                    : 1
Number of discrete variables            : 1
Number of actions                       : 14
Total number of locations               : 8
Average locations per IPTA              : 4.0
Total number of transitions             : 14
Average transitions per IPTA            : 7.0
------------------------------------------------------------

BEGIN CONSTRAINT
 p0 > 1
END CONSTRAINT

------------------------------------------------------------
Constraint soundness                    : possible under-approximation
Termination                             : terminated after reaching a target state (some states may have been unexplored)
Constraint nature                       : good
------------------------------------------------------------
Number of states                        : 20
Number of transitions                   : 24
Number of computed states               : 25
Total computation time                  : 0.007 second
States/second in state space            : 2845.8 (20/0.007 second)
Computed states/second                  : 3557.2 (25/0.007 second)
Estimated memory                        : 2.599 MiB (i.e., 340783 words of size 8)
------------------------------------------------------------

------------------------------------------------------------
 Statistics: Algorithm counters
------------------------------------------------------------
main algorithm + parsing                : 0.008 second
main algorithm                          : 0.007 second
------------------------------------------------------------
 Statistics: Parsing counters
------------------------------------------------------------
model parsing and converting            : 0.001 second
------------------------------------------------------------
 Statistics: State computation counters
------------------------------------------------------------
number of state comparisons             : 6
number of constraints comparisons       : 6
number of new states <= old             : 4
number of new states >= old             : 0
StateSpace.merging attempts             : 2
StateSpace.merges                       : 1
------------------------------------------------------------
 Statistics: Graphics-related counters
------------------------------------------------------------
state space drawing                     : 0.000 second
------------------------------------------------------------
 Statistics: Global counter
------------------------------------------------------------
total                                   : 0.008 second
------------------------------------------------------------