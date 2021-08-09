(************************************************************
 * Result by: IMITATOR 3.1-beta "Cheese Artichoke" (build master/e4be7d7)
 * Model    : 'simop3_tamus_msr.imi'
 * Generated: Mon Aug 9, 2021 21:59:55
 * Command  : imitator simop3_tamus_msr.imi simop3_tamus.imiprop
 ************************************************************)


------------------------------------------------------------
Number of IPTAs                         : 5
Number of clocks                        : 8
Has invariants?                         : true
Has clocks with rate <>1?               : false
L/U subclass                            : U-PTA
Has silent actions?                     : true
Is strongly deterministic?              : true
Number of parameters                    : 6
Number of discrete variables            : 0
Number of actions                       : 25
Total number of locations               : 46
Average locations per IPTA              : 9.2
Total number of transitions             : 72
Average transitions per IPTA            : 14.4
------------------------------------------------------------

BEGIN CONSTRAINT
 p0 + p1 + 2*p2 + p5 >= 1711
& p0 + 2*p2 >= 1615
& p2 + p4 >= 1622
& p0 + p1 + 2*p2 + 2*p3 >= 1687
& p0 + 2*p3 + p5 >= 1735
& p0 + 2*p2 + 2*p3 >= 1675
& p0 + p1 + 2*p3 + p5 >= 1747
& p0 >= 1591
& p2 + p3 + p4 >= 1652
& p0 + p5 >= 1675
& p3 + p4 >= 1640
& p0 + p1 >= 1603
& p4 >= 1610
& p0 + p1 + 2*p3 >= 1663
& p0 + 2*p3 >= 1651
& p0 + 2*p2 + p5 >= 1699
& p0 + p1 + p5 >= 1687
& p0 + p2 + p4 >= 3693
& p0 + p3 + p4 >= 3711
& p0 + p1 + 2*p2 >= 1627
& p0 + p4 >= 3681
& p0 + 2*p2 + 2*p3 + p5 >= 1759
& p1 >= 4
& p2 >= 4
& p3 >= 10
& p5 >= 28
& p0 + p1 + 2*p2 + 2*p3 + p5 >= 1771
& p0 + p2 + p3 + p4 >= 3723
END CONSTRAINT

------------------------------------------------------------
Constraint soundness                    : exact
Termination                             : regular termination
Constraint nature                       : good
------------------------------------------------------------
Number of states                        : 59
Number of transitions                   : 78
Number of computed states               : 79
Total computation time                  : 4.318 seconds
States/second in state space            : 13.6 (59/4.318 seconds)
Computed states/second                  : 18.2 (79/4.318 seconds)
Estimated memory                        : 5.428 MiB (i.e., 711557 words of size 8)
------------------------------------------------------------

------------------------------------------------------------
 Statistics: Algorithm counters
------------------------------------------------------------
main algorithm + parsing                : 4.323 seconds
main algorithm                          : 4.318 seconds
------------------------------------------------------------
 Statistics: Parsing counters
------------------------------------------------------------
model parsing and converting            : 0.005 second
------------------------------------------------------------
 Statistics: State computation counters
------------------------------------------------------------
number of state comparisons             : 25
number of constraints comparisons       : 25
number of new states <= old             : 3
number of new states >= old             : 0
StateSpace.merging attempts             : 22
StateSpace.merges                       : 17
------------------------------------------------------------
 Statistics: Graphics-related counters
------------------------------------------------------------
state space drawing                     : 0.000 second
------------------------------------------------------------
 Statistics: Global counter
------------------------------------------------------------
total                                   : 4.325 seconds
------------------------------------------------------------