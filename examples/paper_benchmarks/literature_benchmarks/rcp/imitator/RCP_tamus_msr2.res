(************************************************************
 * Result output by IMITATOR
 * Version  : IMITATOR 2.12.1 "Butter Lobster" (build 3061)
 * Git      : master/4e8b1c8
 * Model    : 'benchmarks/RCP/RCP_tamus_msr.imi'
 * Generated: Wed Sep 16, 2020 21:58:59
 * Command  : ./bin/imitator benchmarks/RCP/RCP_tamus_msr.imi -mode EFunsafe -incl -output-result -time-limit 1200 -counterexample
 ************************************************************)


------------------------------------------------------------
Number of IPTAs                         : 5
Number of clocks                        : 6
Has stopwatches?                        : false
L/U subclass                            : U-PTA
Has silent actions?                     : false
Is strongly deterministic?              : false
Number of parameters                    : 1
Number of discrete variables            : 0
Number of actions                       : 16
Total number of locations               : 48
Average locations per IPTA              : 9.6
Total number of transitions             : 98
Average transitions per IPTA            : 19.6
------------------------------------------------------------

BEGIN CONSTRAINT
 p0 >= 253
END CONSTRAINT

------------------------------------------------------------
Constraint soundness                    : possible under-approximation
Termination                             : terminated after reaching a target state (some states may have been unexplored)
Constraint nature                       : good
------------------------------------------------------------
Number of states                        : 47
Number of transitions                   : 63
Number of computed states               : 64
Total computation time                  : 0.024 second
States/second in state space            : 1943.6 (47/0.024 second)
Computed states/second                  : 2646.6 (64/0.024 second)
Estimated memory                        : 4.464 MiB (i.e., 585216 words of size 8)
------------------------------------------------------------

------------------------------------------------------------
 Statistics: Algorithm counters
------------------------------------------------------------
main algorithm + parsing                : 0.027 second
main algorithm                          : 0.024 second
------------------------------------------------------------
 Statistics: Parsing counters
------------------------------------------------------------
model parsing and converting            : 0.003 second
------------------------------------------------------------
 Statistics: State computation counters
------------------------------------------------------------
number of state comparisons             : 48
number of constraints comparisons       : 28
number of new states <= old             : 17
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
total                                   : 0.027 second
------------------------------------------------------------