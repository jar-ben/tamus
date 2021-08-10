(************************************************************
 * Result by: IMITATOR 3.1-beta "Cheese Artichoke" (build master/e4be7d7)
 * Model    : 'tamus_examples/accel/accel_1000_tamus.imi'
 * Generated: Mon Aug 9, 2021 23:42:38
 * Command  : imitator tamus_examples/accel/accel_1000_tamus.imi tamus_examples/accel/accel_1000_tamus_witness.imiprop
 ************************************************************)


------------------------------------------------------------
Number of IPTAs                         : 2
Number of clocks                        : 2
Has invariants?                         : true
Has clocks with rate <>1?               : false
L/U subclass                            : U-PTA
Has silent actions?                     : true
Is strongly deterministic?              : true
Number of parameters                    : 13
Number of discrete variables            : 0
Number of actions                       : 11
Total number of locations               : 2574
Average locations per IPTA              : 1287.0
Total number of transitions             : 2592
Average transitions per IPTA            : 1296.0
------------------------------------------------------------

BEGIN CONSTRAINT
 p11 + p12 > 10986
& p11 >= 10986
& p9 >= 0
& p12 >= 0
& p13 >= 0
& p8 >= 0
& p7 >= 0
& p6 >= 7991
& p5 >= 0
& p4 >= 0
& p3 >= 0
& p2 >= 0
& p1 >= 0
& p0 >= 0
END CONSTRAINT

------------------------------------------------------------
Constraint soundness                    : possible under-approximation
Termination                             : terminated after reaching a target state (some states may have been unexplored)
Constraint nature                       : good
------------------------------------------------------------
Number of states                        : 1282
Number of transitions                   : 1281
Number of computed states               : 1282
Total computation time                  : 0.925 second
States/second in state space            : 1384.6 (1282/0.925 second)
Computed states/second                  : 1384.6 (1282/0.925 second)
Estimated memory                        : 565.709 MiB (i.e., 74148733 words of size 8)
------------------------------------------------------------

------------------------------------------------------------
 Statistics: Algorithm counters
------------------------------------------------------------
main algorithm + parsing                : 1.452 seconds
main algorithm                          : 0.925 second
------------------------------------------------------------
 Statistics: Parsing counters
------------------------------------------------------------
model parsing and converting            : 0.526 second
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
total                                   : 1.452 seconds
------------------------------------------------------------