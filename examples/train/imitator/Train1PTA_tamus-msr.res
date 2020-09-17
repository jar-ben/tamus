(************************************************************
 * Result output by IMITATOR
 * Version  : IMITATOR 2.12.1 "Butter Lobster" (build 3061)
 * Git      : master/4e8b1c8
 * Model    : 'benchmarks/Train/Train1PTA_tamus-msr.imi'
 * Generated: Mon Sep 14, 2020 21:03:11
 * Command  : ./bin/imitator benchmarks/Train/Train1PTA_tamus-msr.imi -mode EFunsafe -incl -output-result -time-limit 1200
 ************************************************************)


------------------------------------------------------------
Number of IPTAs                         : 1
Number of clocks                        : 2
Has stopwatches?                        : false
L/U subclass                            : U-PTA
Has silent actions?                     : false
Is strongly deterministic?              : true
Number of parameters                    : 1
Number of discrete variables            : 0
Number of actions                       : 4
Total number of locations               : 5
Average locations per IPTA              : 5.0
Total number of transitions             : 6
Average transitions per IPTA            : 6.0
------------------------------------------------------------

BEGIN CONSTRAINT
 p1 >= 3
END CONSTRAINT

------------------------------------------------------------
Constraint soundness                    : exact
Termination                             : regular termination
Constraint nature                       : good
------------------------------------------------------------
Number of states                        : 5
Number of transitions                   : 5
Number of computed states               : 6
Total computation time                  : 0.001 second
States/second in state space            : 4317.7 (5/0.001 second)
Computed states/second                  : 5181.3 (6/0.001 second)
Estimated memory                        : 2.024 MiB (i.e., 265366 words of size 8)
------------------------------------------------------------

------------------------------------------------------------
 Statistics: Algorithm counters
------------------------------------------------------------
main algorithm + parsing                : 0.002 second
main algorithm                          : 0.001 second
------------------------------------------------------------
 Statistics: Parsing counters
------------------------------------------------------------
model parsing and converting            : 0.000 second
------------------------------------------------------------
 Statistics: State computation counters
------------------------------------------------------------
number of state comparisons             : 1
number of constraints comparisons       : 1
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
total                                   : 0.002 second
------------------------------------------------------------