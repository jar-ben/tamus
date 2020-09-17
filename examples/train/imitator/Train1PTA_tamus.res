(************************************************************
 * Result output by IMITATOR
 * Version  : IMITATOR 2.12.1 "Butter Lobster" (build 3061)
 * Git      : master/4e8b1c8
 * Model    : 'benchmarks/Train/Train1PTA_tamus.imi'
 * Generated: Tue Sep 15, 2020 11:51:39
 * Command  : ./bin/imitator benchmarks/Train/Train1PTA_tamus.imi -mode EFunsafe -incl -output-result -time-limit 1200
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
OR
  p5 >= 0
& p4 >= 1
& p3 >= 0
& p2 >= 0
& p1 >= 0
END CONSTRAINT

------------------------------------------------------------
Constraint soundness                    : exact
Termination                             : regular termination
Constraint nature                       : good
------------------------------------------------------------
Number of states                        : 6
Number of transitions                   : 6
Number of computed states               : 7
Total computation time                  : 0.002 second
States/second in state space            : 2029.8 (6/0.002 second)
Computed states/second                  : 2368.1 (7/0.002 second)
Estimated memory                        : 2.129 MiB (i.e., 279081 words of size 8)
------------------------------------------------------------

------------------------------------------------------------
 Statistics: Algorithm counters
------------------------------------------------------------
main algorithm + parsing                : 0.030 second
main algorithm                          : 0.008 second
------------------------------------------------------------
 Statistics: Parsing counters
------------------------------------------------------------
model parsing and converting            : 0.015 second
------------------------------------------------------------
 Statistics: State computation counters
------------------------------------------------------------
number of state comparisons             : 2
number of constraints comparisons       : 2
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
total                                   : 0.030 second
------------------------------------------------------------