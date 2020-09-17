(************************************************************
 * Result output by IMITATOR
 * Version  : IMITATOR 2.12.1 "Butter Lobster" (build 3061)
 * Git      : master/4e8b1c8
 * Model    : 'benchmarks/Coffee/coffee_tamus_msr.imi'
 * Generated: Wed Sep 16, 2020 19:01:04
 * Command  : ./bin/imitator benchmarks/Coffee/coffee_tamus_msr.imi -mode EFunsafe -incl -output-result -time-limit 1200 -counterexample
 ************************************************************)


------------------------------------------------------------
Number of IPTAs                         : 1
Number of clocks                        : 2
Has stopwatches?                        : false
L/U subclass                            : U-PTA
Has silent actions?                     : false
Is strongly deterministic?              : true
Number of parameters                    : 2
Number of discrete variables            : 0
Number of actions                       : 4
Total number of locations               : 4
Average locations per IPTA              : 4.0
Total number of transitions             : 6
Average transitions per IPTA            : 6.0
------------------------------------------------------------

BEGIN CONSTRAINT
 p1 >= 8
& p0 >= 6
END CONSTRAINT

------------------------------------------------------------
Constraint soundness                    : possible under-approximation
Termination                             : terminated after reaching a target state (some states may have been unexplored)
Constraint nature                       : good
------------------------------------------------------------
Number of states                        : 6
Number of transitions                   : 6
Number of computed states               : 7
Total computation time                  : 0.002 second
States/second in state space            : 2708.9 (6/0.002 second)
Computed states/second                  : 3160.4 (7/0.002 second)
Estimated memory                        : 2.038 MiB (i.e., 267247 words of size 8)
------------------------------------------------------------

------------------------------------------------------------
 Statistics: Algorithm counters
------------------------------------------------------------
main algorithm + parsing                : 0.003 second
main algorithm                          : 0.002 second
------------------------------------------------------------
 Statistics: Parsing counters
------------------------------------------------------------
model parsing and converting            : 0.000 second
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
total                                   : 0.004 second
------------------------------------------------------------