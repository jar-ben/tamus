(************************************************************
 * Result by: IMITATOR 3.1-beta "Cheese Artichoke" (build master/e4be7d7)
 * Model    : 'tamus_examples/accel/accel_1000_tamus.imi'
 * Generated: Tue Jun 8, 2021 00:27:37
 * Command  : imitator tamus_examples/accel/accel_1000_tamus.imi tamus_examples/accel/accel_1000_tamus.imiprop
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
OR
  p13 + p11 >= 2950
& p4 >= 0
& p9 >= 0
& p6 >= 0
& p11 >= 2750
& p11 + p12 > 2750
& p12 >= 0
& p13 >= 0
& p5 >= 2861
& p4 + p5 > 2861
& p5 + p6 >= 2900
& p8 >= 0
& p7 >= 0
& p3 >= 0
& p2 >= 0
& p1 >= 0
& p0 >= 0
OR
  p11 >= 1558
& p9 > 23
& p4 >= 0
& p11 + p12 > 1558
& p9 + p12 > 23
& p12 >= 0
& p13 >= 1390
& p4 + p5 > 4364
& p5 >= 4364
& p13 + p11 >= 2950
& p9 + p13 > 1415
& p8 >= 0
& p7 >= 0
& p6 >= 0
& p3 >= 0
& p2 >= 0
& p1 >= 0
& p0 >= 0
END CONSTRAINT

------------------------------------------------------------
Constraint soundness                    : exact
Termination                             : regular termination
Constraint nature                       : good
------------------------------------------------------------
Number of states                        : 6506
Number of transitions                   : 6505
Number of computed states               : 6506
Total computation time                  : 231.282 seconds
States/second in state space            : 28.1 (6506/231.282 seconds)
Computed states/second                  : 28.1 (6506/231.282 seconds)
Estimated memory                        : 631.772 MiB (i.e., 82807671 words of size 8)
------------------------------------------------------------

------------------------------------------------------------
 Statistics: Algorithm counters
------------------------------------------------------------
main algorithm + parsing                : 231.955 seconds
main algorithm                          : 231.282 seconds
------------------------------------------------------------
 Statistics: Parsing counters
------------------------------------------------------------
model parsing and converting            : 0.671 second
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
total                                   : 231.955 seconds
------------------------------------------------------------