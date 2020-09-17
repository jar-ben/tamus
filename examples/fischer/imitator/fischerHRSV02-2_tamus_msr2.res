(************************************************************
 * Result output by IMITATOR
 * Version  : IMITATOR 2.12.1 "Butter Lobster" (build 3061)
 * Git      : master/4e8b1c8
 * Model    : 'benchmarks/Fischer/fischerHRSV02-2_tamus_msr.imi'
 * Generated: Wed Sep 16, 2020 22:03:49
 * Command  : ./bin/imitator benchmarks/Fischer/fischerHRSV02-2_tamus_msr.imi -mode EFunsafe -incl -output-result -time-limit 1200 -counterexample
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
 p0 > 2
END CONSTRAINT

------------------------------------------------------------
Constraint soundness                    : possible under-approximation
Termination                             : terminated after reaching a target state (some states may have been unexplored)
Constraint nature                       : good
------------------------------------------------------------
Number of states                        : 27
Number of transitions                   : 34
Number of computed states               : 35
Total computation time                  : 0.009 second
States/second in state space            : 2733.3 (27/0.009 second)
Computed states/second                  : 3543.2 (35/0.009 second)
Estimated memory                        : 2.819 MiB (i.e., 369571 words of size 8)
------------------------------------------------------------

------------------------------------------------------------
 Statistics: Algorithm counters
------------------------------------------------------------
main algorithm + parsing                : 0.012 second
main algorithm                          : 0.009 second
------------------------------------------------------------
 Statistics: Parsing counters
------------------------------------------------------------
model parsing and converting            : 0.001 second
------------------------------------------------------------
 Statistics: State computation counters
------------------------------------------------------------
number of state comparisons             : 38
number of constraints comparisons       : 17
number of new states <= old             : 8
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
total                                   : 0.012 second
------------------------------------------------------------