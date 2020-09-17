(************************************************************
 * Result output by IMITATOR
 * Version  : IMITATOR 2.12.1 "Butter Lobster" (build 3061)
 * Git      : master/4e8b1c8
 * Model    : 'benchmarks/NuclearPlant/NuclearPlant_tamus.imi'
 * Generated: Wed Sep 16, 2020 22:09:41
 * Command  : ./bin/imitator benchmarks/NuclearPlant/NuclearPlant_tamus.imi -mode EFunsafe -incl -output-result -time-limit 1200 -counterexample
 ************************************************************)


------------------------------------------------------------
Number of IPTAs                         : 1
Number of clocks                        : 2
Has stopwatches?                        : false
L/U subclass                            : L/U-PTA
Has silent actions?                     : false
Is strongly deterministic?              : true
Number of parameters                    : 10
Number of discrete variables            : 0
Number of actions                       : 6
Total number of locations               : 6
Average locations per IPTA              : 6.0
Total number of transitions             : 8
Average transitions per IPTA            : 8.0
------------------------------------------------------------

BEGIN CONSTRAINT
 p14 >= 0
& p13 >= 0
& p12 >= 0
& p11 >= 0
& p9 >= 8 + p10
& p8 >= p10
& p10 >= 0
& p7 >= 0
& p6 >= 0
& p5 >= 0
END CONSTRAINT

------------------------------------------------------------
Constraint soundness                    : possible under-approximation
Termination                             : terminated after reaching a target state (some states may have been unexplored)
Constraint nature                       : good
------------------------------------------------------------
Number of states                        : 4
Number of transitions                   : 3
Number of computed states               : 4
Total computation time                  : 0.002 second
States/second in state space            : 1971.4 (4/0.002 second)
Computed states/second                  : 1971.4 (4/0.002 second)
Estimated memory                        : 2.300 MiB (i.e., 301564 words of size 8)
------------------------------------------------------------

------------------------------------------------------------
 Statistics: Algorithm counters
------------------------------------------------------------
main algorithm + parsing                : 0.004 second
main algorithm                          : 0.002 second
------------------------------------------------------------
 Statistics: Parsing counters
------------------------------------------------------------
model parsing and converting            : 0.002 second
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