(************************************************************
 * Result output by IMITATOR
 * Version  : IMITATOR 2.12.1 "Butter Lobster" (build 3061)
 * Git      : master/4e8b1c8
 * Model    : 'benchmarks/Fischer/fischerHRSV02-2_tamus_msr.imi'
 * Generated: Wed Sep 16, 2020 09:12:50
 * Command  : ./bin/imitator benchmarks/Fischer/fischerHRSV02-2_tamus_msr.imi -mode EFunsafe -incl -output-result -time-limit 1200 -depth-limit 20
 ************************************************************)


------------------------------------------------------------
Number of IPTAs                         : 2
Number of clocks                        : 2
Has stopwatches?                        : false
L/U subclass                            : U-PTA
Has silent actions?                     : true
Is strongly deterministic?              : true
Number of parameters                    : 1
Number of discrete variables            : 1
Number of actions                       : 14
Total number of locations               : 8
Average locations per IPTA              : 4.0
Total number of transitions             : 14
Average transitions per IPTA            : 7.0
------------------------------------------------------------

BEGIN CONSTRAINT
 p0 > 1
END CONSTRAINT

------------------------------------------------------------
Constraint soundness                    : possible under-approximation
Termination                             : depth limit (2 successors unexplored)
Constraint nature                       : good
------------------------------------------------------------
Number of states                        : 84
Number of transitions                   : 134
Number of computed states               : 135
Total computation time                  : 0.052 second
States/second in state space            : 1608.0 (84/0.052 second)
Computed states/second                  : 2584.4 (135/0.052 second)
Estimated memory                        : 4.525 MiB (i.e., 593192 words of size 8)
------------------------------------------------------------

------------------------------------------------------------
 Statistics: Algorithm counters
------------------------------------------------------------
main algorithm + parsing                : 0.056 second
main algorithm                          : 0.052 second
------------------------------------------------------------
 Statistics: Parsing counters
------------------------------------------------------------
model parsing and converting            : 0.004 second
------------------------------------------------------------
 Statistics: State computation counters
------------------------------------------------------------
number of state comparisons             : 895
number of constraints comparisons       : 428
number of new states <= old             : 51
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
total                                   : 0.056 second
------------------------------------------------------------