(************************************************************
 * Result output by IMITATOR
 * Version  : IMITATOR 2.12.1 "Butter Lobster" (build 3061)
 * Git      : master/4e8b1c8
 * Model    : 'benchmarks/Jobshop/maler_4_4_tamus_msr.imi'
 * Generated: Tue Sep 15, 2020 19:31:39
 * Command  : ./bin/imitator benchmarks/Jobshop/maler_4_4_tamus_msr.imi -mode EFunsafe -incl -output-result -time-limit 1200
 ************************************************************)


------------------------------------------------------------
Number of IPTAs                         : 4
Number of clocks                        : 4
Has stopwatches?                        : false
L/U subclass                            : U-PTA
Has silent actions?                     : false
Is strongly deterministic?              : true
Number of parameters                    : 5
Number of discrete variables            : 4
Number of actions                       : 4
Total number of locations               : 36
Average locations per IPTA              : 9.0
Total number of transitions             : 32
Average transitions per IPTA            : 8.0
------------------------------------------------------------

BEGIN CONSTRAINT
 p2 >= 1
& p0 >= 1
& p4 >= 1
& p3 >= 1
& p1 >= 1
END CONSTRAINT

------------------------------------------------------------
Constraint soundness                    : exact
Termination                             : regular termination
Constraint nature                       : good
------------------------------------------------------------
Number of states                        : 166066
Number of transitions                   : 372048
Number of computed states               : 372049
Total computation time                  : 949.523 seconds
States/second in state space            : 174.8 (166066/949.523 seconds)
Computed states/second                  : 391.8 (372049/949.523 seconds)
Estimated memory                        : 57.138 GiB (i.e., 7668943419 words of size 8)
------------------------------------------------------------

------------------------------------------------------------
 Statistics: Algorithm counters
------------------------------------------------------------
main algorithm + parsing                : 949.526 seconds
main algorithm                          : 949.523 seconds
------------------------------------------------------------
 Statistics: Parsing counters
------------------------------------------------------------
model parsing and converting            : 0.003 second
------------------------------------------------------------
 Statistics: State computation counters
------------------------------------------------------------
number of state comparisons             : 178140416
number of constraints comparisons       : 25986342
number of new states <= old             : 205983
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
total                                   : 949.526 seconds
------------------------------------------------------------