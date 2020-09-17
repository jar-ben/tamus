(************************************************************
 * Result output by IMITATOR
 * Version  : IMITATOR 2.12.1 "Butter Lobster" (build 3061)
 * Git      : master/4e8b1c8
 * Model    : 'benchmarks/Train/Train1PTA_tamus.imi'
 * Generated: Wed Sep 16, 2020 22:11:43
 * Command  : ./bin/imitator benchmarks/Train/Train1PTA_tamus.imi -mode EFunsafe -incl -output-result -time-limit 1200 -counterexample
 ************************************************************)


------------------------------------------------------------
Number of IPTAs                         : 1
Number of clocks                        : 2
Has stopwatches?                        : false
L/U subclass                            : U-PTA
Has silent actions?                     : false
Is strongly deterministic?              : true
Number of parameters                    : 5
Number of discrete variables            : 0
Number of actions                       : 4
Total number of locations               : 5
Average locations per IPTA              : 5.0
Total number of transitions             : 6
Average transitions per IPTA            : 6.0
------------------------------------------------------------

BEGIN CONSTRAINT
 p5 >= 0
& p4 >= 0
& p3 >= 0
& p2 >= 3
& p1 >= 0
END CONSTRAINT

------------------------------------------------------------
Constraint soundness                    : possible under-approximation
Termination                             : terminated after reaching a target state (some states may have been unexplored)
Constraint nature                       : good
------------------------------------------------------------
Number of states                        : 4
Number of transitions                   : 3
Number of computed states               : 4
Total computation time                  : 0.003 second
States/second in state space            : 1160.4 (4/0.003 second)
Computed states/second                  : 1160.4 (4/0.003 second)
Estimated memory                        : 2.082 MiB (i.e., 272996 words of size 8)
------------------------------------------------------------

------------------------------------------------------------
 Statistics: Algorithm counters
------------------------------------------------------------
main algorithm + parsing                : 0.005 second
main algorithm                          : 0.003 second
------------------------------------------------------------
 Statistics: Parsing counters
------------------------------------------------------------
model parsing and converting            : 0.001 second
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
total                                   : 0.005 second
------------------------------------------------------------