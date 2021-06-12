(************************************************************
 * Result by: IMITATOR 3.1-beta "Cheese Artichoke" (build master/e4be7d7)
 * Model    : 'tamus_examples/accel/accel_1000_tamus_msr.imi'
 * Generated: Tue Jun 8, 2021 00:27:42
 * Command  : imitator tamus_examples/accel/accel_1000_tamus_msr.imi tamus_examples/accel/accel_1000_tamus_witness.imiprop
 ************************************************************)


------------------------------------------------------------
Number of IPTAs                         : 2
Number of clocks                        : 2
Has invariants?                         : true
Has clocks with rate <>1?               : false
L/U subclass                            : U-PTA
Has silent actions?                     : true
Is strongly deterministic?              : true
Number of parameters                    : 2
Number of discrete variables            : 0
Number of actions                       : 11
Total number of locations               : 2574
Average locations per IPTA              : 1287.0
Total number of transitions             : 2592
Average transitions per IPTA            : 1296.0
------------------------------------------------------------

BEGIN CONSTRAINT
 p1 >= 2950
& p2 >= 2900
END CONSTRAINT

------------------------------------------------------------
Constraint soundness                    : possible under-approximation
Termination                             : terminated after reaching a target state (some states may have been unexplored)
Constraint nature                       : good
------------------------------------------------------------
Number of states                        : 1488
Number of transitions                   : 1487
Number of computed states               : 1488
Total computation time                  : 0.413 second
States/second in state space            : 3594.6 (1488/0.413 second)
Computed states/second                  : 3594.6 (1488/0.413 second)
Estimated memory                        : 570.473 MiB (i.e., 74773044 words of size 8)
------------------------------------------------------------

------------------------------------------------------------
 Statistics: Algorithm counters
------------------------------------------------------------
main algorithm + parsing                : 0.947 second
main algorithm                          : 0.413 second
------------------------------------------------------------
 Statistics: Parsing counters
------------------------------------------------------------
model parsing and converting            : 0.533 second
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
total                                   : 0.947 second
------------------------------------------------------------