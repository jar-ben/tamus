(************************************************************
 * Result by: IMITATOR 3.1-beta "Cheese Artichoke" (build master/e4be7d7)
 * Model    : 'tamus_examples/jlr/JLR13-3tasks-npfp-100-2_tamus_msr.imi'
 * Generated: Tue Aug 10, 2021 00:42:46
 * Command  : imitator tamus_examples/jlr/JLR13-3tasks-npfp-100-2_tamus_msr.imi tamus_examples/jlr/JLR13-3tasks-npfp-100-2_tamus_witness.imiprop
 ************************************************************)


------------------------------------------------------------
Number of IPTAs                         : 4
Number of clocks                        : 6
Has invariants?                         : true
Has clocks with rate <>1?               : false
L/U subclass                            : U-PTA
Has silent actions?                     : true
Is strongly deterministic?              : true
Number of parameters                    : 1
Number of discrete variables            : 0
Number of actions                       : 15
Total number of locations               : 17
Average locations per IPTA              : 4.2
Total number of transitions             : 54
Average transitions per IPTA            : 13.5
------------------------------------------------------------

BEGIN CONSTRAINT
 p0 >= 20
END CONSTRAINT

------------------------------------------------------------
Constraint soundness                    : possible under-approximation
Termination                             : terminated after reaching a target state (some states may have been unexplored)
Constraint nature                       : good
------------------------------------------------------------
Number of states                        : 92
Number of transitions                   : 107
Number of computed states               : 108
Total computation time                  : 0.084 second
States/second in state space            : 1083.1 (92/0.084 second)
Computed states/second                  : 1271.5 (108/0.084 second)
Estimated memory                        : 4.838 MiB (i.e., 634146 words of size 8)
------------------------------------------------------------

------------------------------------------------------------
 Statistics: Algorithm counters
------------------------------------------------------------
main algorithm + parsing                : 0.088 second
main algorithm                          : 0.084 second
------------------------------------------------------------
 Statistics: Parsing counters
------------------------------------------------------------
model parsing and converting            : 0.003 second
------------------------------------------------------------
 Statistics: State computation counters
------------------------------------------------------------
number of state comparisons             : 548
number of constraints comparisons       : 548
number of new states <= old             : 10
number of new states >= old             : 0
StateSpace.merging attempts             : 607
StateSpace.merges                       : 6
------------------------------------------------------------
 Statistics: Graphics-related counters
------------------------------------------------------------
state space drawing                     : 0.000 second
------------------------------------------------------------
 Statistics: Global counter
------------------------------------------------------------
total                                   : 0.088 second
------------------------------------------------------------