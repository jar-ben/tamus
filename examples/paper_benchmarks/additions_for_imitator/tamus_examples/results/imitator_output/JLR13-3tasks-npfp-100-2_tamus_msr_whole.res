(************************************************************
 * Result by: IMITATOR 3.1-beta "Cheese Artichoke" (build master/e4be7d7)
 * Model    : 'tamus_examples/jlr/JLR13-3tasks-npfp-100-2_tamus_msr.imi'
 * Generated: Tue Aug 10, 2021 00:42:46
 * Command  : imitator tamus_examples/jlr/JLR13-3tasks-npfp-100-2_tamus_msr.imi tamus_examples/jlr/JLR13-3tasks-npfp-100-2_tamus.imiprop
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
Constraint soundness                    : exact
Termination                             : regular termination
Constraint nature                       : good
------------------------------------------------------------
Number of states                        : 198
Number of transitions                   : 261
Number of computed states               : 1603
Total computation time                  : 3.132 seconds
States/second in state space            : 63.2 (198/3.132 seconds)
Computed states/second                  : 511.7 (1603/3.132 seconds)
Estimated memory                        : 62.590 MiB (i.e., 8203829 words of size 8)
------------------------------------------------------------

------------------------------------------------------------
 Statistics: Algorithm counters
------------------------------------------------------------
main algorithm + parsing                : 3.226 seconds
main algorithm                          : 3.132 seconds
------------------------------------------------------------
 Statistics: Parsing counters
------------------------------------------------------------
model parsing and converting            : 0.094 second
------------------------------------------------------------
 Statistics: State computation counters
------------------------------------------------------------
number of state comparisons             : 40813
number of constraints comparisons       : 40813
number of new states <= old             : 284
number of new states >= old             : 0
StateSpace.merging attempts             : 41112
StateSpace.merges                       : 170
------------------------------------------------------------
 Statistics: Graphics-related counters
------------------------------------------------------------
state space drawing                     : 0.000 second
------------------------------------------------------------
 Statistics: Global counter
------------------------------------------------------------
total                                   : 3.226 seconds
------------------------------------------------------------