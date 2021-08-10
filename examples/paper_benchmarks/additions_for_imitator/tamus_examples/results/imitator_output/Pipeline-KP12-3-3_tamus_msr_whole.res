(************************************************************
 * Result by: IMITATOR 3.1-beta "Cheese Artichoke" (build master/e4be7d7)
 * Model    : 'tamus_examples/pipeline/Pipeline-KP12-3-3_tamus_msr.imi'
 * Generated: Tue Aug 10, 2021 01:32:52
 * Command  : imitator tamus_examples/pipeline/Pipeline-KP12-3-3_tamus_msr.imi tamus_examples/pipeline/Pipeline-KP12-3-3_tamus.imiprop
 ************************************************************)


------------------------------------------------------------
Number of IPTAs                         : 6
Number of clocks                        : 6
Has invariants?                         : true
Has clocks with rate <>1?               : false
L/U subclass                            : U-PTA
Has silent actions?                     : true
Is strongly deterministic?              : true
Number of parameters                    : 1
Number of discrete variables            : 0
Number of actions                       : 16
Total number of locations               : 21
Average locations per IPTA              : 3.5
Total number of transitions             : 20
Average transitions per IPTA            : 3.3
------------------------------------------------------------

BEGIN CONSTRAINT
 p0 >= 2
END CONSTRAINT

------------------------------------------------------------
Constraint soundness                    : exact
Termination                             : regular termination
Constraint nature                       : good
------------------------------------------------------------
Number of states                        : 29
Number of transitions                   : 41
Number of computed states               : 42
Total computation time                  : 0.023 second
States/second in state space            : 1215.6 (29/0.023 second)
Computed states/second                  : 1760.6 (42/0.023 second)
Estimated memory                        : 3.683 MiB (i.e., 482824 words of size 8)
------------------------------------------------------------

------------------------------------------------------------
 Statistics: Algorithm counters
------------------------------------------------------------
main algorithm + parsing                : 0.029 second
main algorithm                          : 0.023 second
------------------------------------------------------------
 Statistics: Parsing counters
------------------------------------------------------------
model parsing and converting            : 0.005 second
------------------------------------------------------------
 Statistics: State computation counters
------------------------------------------------------------
number of state comparisons             : 13
number of constraints comparisons       : 13
number of new states <= old             : 0
number of new states >= old             : 0
StateSpace.merging attempts             : 13
StateSpace.merges                       : 13
------------------------------------------------------------
 Statistics: Graphics-related counters
------------------------------------------------------------
state space drawing                     : 0.000 second
------------------------------------------------------------
 Statistics: Global counter
------------------------------------------------------------
total                                   : 0.029 second
------------------------------------------------------------