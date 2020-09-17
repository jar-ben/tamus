(************************************************************
 * Result output by IMITATOR
 * Version  : IMITATOR 2.12.1 "Butter Lobster" (build 3061)
 * Git      : master/4e8b1c8
 * Model    : 'benchmarks/Fischer/fischerHRSV02-2_tamus.imi'
 * Generated: Wed Sep 16, 2020 09:12:42
 * Command  : ./bin/imitator benchmarks/Fischer/fischerHRSV02-2_tamus.imi -mode EFunsafe -incl -output-result -time-limit 1200 -depth-limit 20
 ************************************************************)


------------------------------------------------------------
Number of IPTAs                         : 2
Number of clocks                        : 2
Has stopwatches?                        : false
L/U subclass                            : U-PTA
Has silent actions?                     : true
Is strongly deterministic?              : true
Number of parameters                    : 16
Number of discrete variables            : 1
Number of actions                       : 14
Total number of locations               : 8
Average locations per IPTA              : 4.0
Total number of transitions             : 14
Average transitions per IPTA            : 7.0
------------------------------------------------------------

BEGIN CONSTRAINT
 p6 >= 0
& p4 >= 0
& p14 >= 0
& p10 >= 0
& p4 + p5 + p6 + p9 + p10 > 1
& p5 >= 0
& p9 >= 0
& p6 + p10 > 1
& p15 >= 0
& p13 >= 0
& p12 >= 0
& p11 >= 0
& p8 >= 0
& p7 >= 0
& p3 >= 0
& p2 >= 0
& p1 >= 0
& p0 >= 0
OR
  p2 >= 0
& p1 >= 0
& p6 >= 0
& p14 >= 0
& p1 + p2 + p12 + p13 + p14 > 1
& p12 >= 0
& p13 >= 0
& p2 + p14 > 1
& p15 >= 0
& p11 >= 0
& p10 >= 0
& p9 >= 0
& p8 >= 0
& p7 >= 0
& p5 >= 0
& p4 >= 0
& p3 >= 0
& p0 >= 0
END CONSTRAINT

------------------------------------------------------------
Constraint soundness                    : possible under-approximation
Termination                             : depth limit (214 successors unexplored)
Constraint nature                       : good
------------------------------------------------------------
Number of states                        : 1735
Number of transitions                   : 2984
Number of computed states               : 2985
Total computation time                  : 60.979 seconds
States/second in state space            : 28.4 (1735/60.979 seconds)
Computed states/second                  : 48.9 (2985/60.979 seconds)
Estimated memory                        : 232.933 MiB (i.e., 30531072 words of size 8)
------------------------------------------------------------

------------------------------------------------------------
 Statistics: Algorithm counters
------------------------------------------------------------
main algorithm + parsing                : 60.986 seconds
main algorithm                          : 60.979 seconds
------------------------------------------------------------
 Statistics: Parsing counters
------------------------------------------------------------
model parsing and converting            : 0.007 second
------------------------------------------------------------
 Statistics: State computation counters
------------------------------------------------------------
number of state comparisons             : 972812
number of constraints comparisons       : 486421
number of new states <= old             : 1250
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
total                                   : 60.987 seconds
------------------------------------------------------------