(************************************************************
 * Result by: IMITATOR 3.1-beta "Cheese Artichoke" (build master/e4be7d7)
 * Model    : 'tamus_examples/coffee/coffee_tamus_msr.imi'
 * Generated: Tue Jun 8, 2021 00:27:43
 * Command  : imitator tamus_examples/coffee/coffee_tamus_msr.imi tamus_examples/coffee/coffee_tamus_witness.imiprop
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
Constraint soundness                    : possible under-approximation
Termination                             : terminated after reaching a target state (some states may have been unexplored)
Constraint nature                       : good
------------------------------------------------------------
Number of states                        : 6
Number of transitions                   : 6
Number of computed states               : 7
Total computation time                  : 0.002 second
States/second in state space            : 2723.5 (6/0.002 second)
Computed states/second                  : 3177.5 (7/0.002 second)
Estimated memory                        : 1.973 MiB (i.e., 258695 words of size 8)
------------------------------------------------------------

------------------------------------------------------------
 Statistics: Algorithm counters
------------------------------------------------------------
main algorithm + parsing                : 0.003 second
main algorithm                          : 0.002 second
------------------------------------------------------------
 Statistics: Parsing counters
------------------------------------------------------------
model parsing and converting            : 0.001 second
------------------------------------------------------------
 Statistics: State computation counters
------------------------------------------------------------
number of state comparisons             : 3
number of constraints comparisons       : 3
number of new states <= old             : 1
number of new states >= old             : 0
StateSpace.merging attempts             : 1
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