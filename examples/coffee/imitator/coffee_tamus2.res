(************************************************************
 * Result output by IMITATOR
 * Version  : IMITATOR 2.12.1 "Butter Lobster" (build 3061)
 * Git      : master/4e8b1c8
 * Model    : 'benchmarks/Coffee/coffee_tamus.imi'
 * Generated: Wed Sep 16, 2020 19:00:53
 * Command  : ./bin/imitator benchmarks/Coffee/coffee_tamus.imi -mode EFunsafe -incl -output-result -time-limit 1200 -counterexample
 ************************************************************)


------------------------------------------------------------
Number of IPTAs                         : 1
Number of clocks                        : 2
Has stopwatches?                        : false
L/U subclass                            : U-PTA
Has silent actions?                     : false
Is strongly deterministic?              : true
Number of parameters                    : 10
Number of discrete variables            : 0
Number of actions                       : 4
Total number of locations               : 4
Average locations per IPTA              : 4.0
Total number of transitions             : 6
Average transitions per IPTA            : 6.0
------------------------------------------------------------

BEGIN CONSTRAINT
 p5 >= 0
& p2 >= 0
& p6 + p7 >= 6
& p0 >= 0
& p4 >= 0
& p6 >= 0
& p0 + p5 >= 1
& p5 + p6 >= 7
& p2 + p5 >= 4
& p7 >= 0
& p4 + p5 >= 8
& p9 >= 0
& p8 >= 0
& p3 >= 0
& p1 >= 0
END CONSTRAINT

------------------------------------------------------------
Constraint soundness                    : possible under-approximation
Termination                             : terminated after reaching a target state (some states may have been unexplored)
Constraint nature                       : good
------------------------------------------------------------
Number of states                        : 6
Number of transitions                   : 6
Number of computed states               : 7
Total computation time                  : 0.005 second
States/second in state space            : 1018.1 (6/0.005 second)
Computed states/second                  : 1187.8 (7/0.005 second)
Estimated memory                        : 2.232 MiB (i.e., 292620 words of size 8)
------------------------------------------------------------

------------------------------------------------------------
 Statistics: Algorithm counters
------------------------------------------------------------
main algorithm + parsing                : 0.007 second
main algorithm                          : 0.005 second
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
StateSpace.merging attempts             : 0
StateSpace.merges                       : 0
------------------------------------------------------------
 Statistics: Graphics-related counters
------------------------------------------------------------
state space drawing                     : 0.000 second
------------------------------------------------------------
 Statistics: Global counter
------------------------------------------------------------
total                                   : 0.008 second
------------------------------------------------------------