(************************************************************
 * Result output by IMITATOR
 * Version  : IMITATOR 2.12.1 "Butter Lobster" (build 3061)
 * Git      : master/4e8b1c8
 * Model    : 'benchmarks/NuclearPlant/NuclearPlant_tamus.imi'
 * Generated: Mon Sep 14, 2020 21:12:46
 * Command  : ./bin/imitator benchmarks/NuclearPlant/NuclearPlant_tamus.imi -mode EFunsafe -incl -output-result -time-limit 1200
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
OR
  p13 >= 0
& p12 >= 5 + p14
& p11 >= p14
& p14 >= 0
& p10 >= 0
& p9 >= 0
& p8 >= 0
& p7 >= 0
& p6 >= 0
& p5 >= 0
OR
  p14 >= 0
& p12 >= 0
& p11 >= 0
& p10 >= 0
& p9 >= 0
& p8 >= 0
& p7 >= 0
& p6 >= 1 + p13
& p5 >= p13
& p13 >= 0
END CONSTRAINT

------------------------------------------------------------
Constraint soundness                    : exact
Termination                             : regular termination
Constraint nature                       : good
------------------------------------------------------------
Number of states                        : 8
Number of transitions                   : 8
Number of computed states               : 9
Total computation time                  : 0.010 second
States/second in state space            : 769.2 (8/0.010 second)
Computed states/second                  : 865.4 (9/0.010 second)
Estimated memory                        : 2.432 MiB (i.e., 318799 words of size 8)
------------------------------------------------------------

------------------------------------------------------------
 Statistics: Algorithm counters
------------------------------------------------------------
main algorithm + parsing                : 0.013 second
main algorithm                          : 0.010 second
------------------------------------------------------------
 Statistics: Parsing counters
------------------------------------------------------------
model parsing and converting            : 0.002 second
------------------------------------------------------------
 Statistics: State computation counters
------------------------------------------------------------
number of state comparisons             : 4
number of constraints comparisons       : 4
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
total                                   : 0.013 second
------------------------------------------------------------