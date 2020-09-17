(************************************************************
 * Result output by IMITATOR
 * Version  : IMITATOR 2.12.1 "Butter Lobster" (build 3061)
 * Git      : master/4e8b1c8
 * Model    : 'benchmarks/WFAS/WFAS_tamus-msr.imi'
 * Generated: Wed Sep 16, 2020 22:13:56
 * Command  : ./bin/imitator benchmarks/WFAS/WFAS_tamus-msr.imi -mode EFunsafe -incl -output-result -time-limit 1200 -counterexample
 ************************************************************)


------------------------------------------------------------
Number of IPTAs                         : 3
Number of clocks                        : 4
Has stopwatches?                        : false
L/U subclass                            : U-PTA
Has silent actions?                     : true
Is strongly deterministic?              : false
Number of parameters                    : 1
Number of discrete variables            : 0
Number of actions                       : 10
Total number of locations               : 10
Average locations per IPTA              : 3.3
Total number of transitions             : 23
Average transitions per IPTA            : 7.6
------------------------------------------------------------

BEGIN CONSTRAINT
 p3 > 5
END CONSTRAINT

------------------------------------------------------------
Constraint soundness                    : possible under-approximation
Termination                             : terminated after reaching a target state (some states may have been unexplored)
Constraint nature                       : good
------------------------------------------------------------
Number of states                        : 11
Number of transitions                   : 10
Number of computed states               : 11
Total computation time                  : 0.004 second
States/second in state space            : 2276.0 (11/0.004 second)
Computed states/second                  : 2276.0 (11/0.004 second)
Estimated memory                        : 2.474 MiB (i.e., 324286 words of size 8)
------------------------------------------------------------

------------------------------------------------------------
 Statistics: Algorithm counters
------------------------------------------------------------
main algorithm + parsing                : 0.006 second
main algorithm                          : 0.004 second
------------------------------------------------------------
 Statistics: Parsing counters
------------------------------------------------------------
model parsing and converting            : 0.001 second
------------------------------------------------------------
 Statistics: State computation counters
------------------------------------------------------------
number of state comparisons             : 5
number of constraints comparisons       : 3
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
total                                   : 0.006 second
------------------------------------------------------------