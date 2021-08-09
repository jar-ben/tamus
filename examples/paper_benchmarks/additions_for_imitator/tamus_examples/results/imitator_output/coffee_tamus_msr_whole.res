(************************************************************
 * Result by: IMITATOR 3.1-beta "Cheese Artichoke" (build master/e4be7d7)
 * Model    : 'tamus_examples/coffee/coffee_tamus_msr.imi'
 * Generated: Tue Jun 8, 2021 00:27:43
 * Command  : imitator tamus_examples/coffee/coffee_tamus_msr.imi tamus_examples/coffee/coffee_tamus.imiprop
 ************************************************************)


------------------------------------------------------------
Number of IPTAs                         : 1
Number of clocks                        : 2
Has invariants?                         : true
Has clocks with rate <>1?               : false
L/U subclass                            : U-PTA
Has silent actions?                     : false
Is strongly deterministic?              : true
Number of parameters                    : 2
Number of discrete variables            : 0
Number of actions                       : 4
Total number of locations               : 4
Average locations per IPTA              : 4.0
Total number of transitions             : 6
Average transitions per IPTA            : 6.0
------------------------------------------------------------

BEGIN CONSTRAINT
 p1 >= 8
& p0 >= 6
END CONSTRAINT

------------------------------------------------------------
Constraint soundness                    : exact
Termination                             : regular termination
Constraint nature                       : good
------------------------------------------------------------
Number of states                        : 6
Number of transitions                   : 7
Number of computed states               : 8
Total computation time                  : 0.001 second
States/second in state space            : 4037.5 (6/0.001 second)
Computed states/second                  : 5383.3 (8/0.001 second)
Estimated memory                        : 1.976 MiB (i.e., 259021 words of size 8)
------------------------------------------------------------

------------------------------------------------------------
 Statistics: Algorithm counters
------------------------------------------------------------
main algorithm + parsing                : 0.003 second
main algorithm                          : 0.001 second
------------------------------------------------------------
 Statistics: Parsing counters
------------------------------------------------------------
model parsing and converting            : 0.001 second
------------------------------------------------------------
 Statistics: State computation counters
------------------------------------------------------------
number of state comparisons             : 4
number of constraints comparisons       : 4
number of new states <= old             : 2
number of new states >= old             : 0
StateSpace.merging attempts             : 2
StateSpace.merges                       : 0
------------------------------------------------------------
 Statistics: Graphics-related counters
------------------------------------------------------------
state space drawing                     : 0.000 second
------------------------------------------------------------
 Statistics: Global counter
------------------------------------------------------------
total                                   : 0.003 second
------------------------------------------------------------