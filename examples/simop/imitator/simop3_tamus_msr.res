(************************************************************
 * Result output by IMITATOR
 * Version  : IMITATOR 2.12.1 "Butter Lobster" (build 3061)
 * Git      : master/4e8b1c8
 * Model    : 'benchmarks/SIMOP/simop3_tamus_msr.imi'
 * Generated: Wed Sep 16, 2020 22:00:51
 * Command  : ./bin/imitator benchmarks/SIMOP/simop3_tamus_msr.imi -mode EFunsafe -incl -output-result -time-limit 1200
 ************************************************************)


------------------------------------------------------------
Number of IPTAs                         : 5
Number of clocks                        : 8
Has stopwatches?                        : false
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
Number of states                        : 99
Number of transitions                   : 124
Number of computed states               : 125
Total computation time                  : 7.258 seconds
States/second in state space            : 13.6 (99/7.258 seconds)
Computed states/second                  : 17.2 (125/7.258 seconds)
Estimated memory                        : 6.759 MiB (i.e., 886007 words of size 8)
------------------------------------------------------------

------------------------------------------------------------
 Statistics: Algorithm counters
------------------------------------------------------------
main algorithm + parsing                : 7.266 seconds
main algorithm                          : 7.258 seconds
------------------------------------------------------------
 Statistics: Parsing counters
------------------------------------------------------------
model parsing and converting            : 0.008 second
------------------------------------------------------------
 Statistics: State computation counters
------------------------------------------------------------
number of state comparisons             : 204
number of constraints comparisons       : 94
number of new states <= old             : 26
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
total                                   : 7.268 seconds
------------------------------------------------------------