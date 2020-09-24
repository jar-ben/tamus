(************************************************************
 * Result output by IMITATOR
 * Version  : IMITATOR 2.12.1 "Butter Lobster" (build 3061)
 * Git      : master/4e8b1c8
 * Model    : 'benchmarks/Scheduling/non-preemptive-scheduling/JLR13-3tasks-npfp-100-2_tamus-msr.imi'
 * Generated: Mon Sep 14, 2020 22:19:17
 * Command  : ./bin/imitator benchmarks/Scheduling/non-preemptive-scheduling/JLR13-3tasks-npfp-100-2_tamus-msr.imi -mode EFunsafe -incl -output-result -time-limit 1200
 ************************************************************)


------------------------------------------------------------
Number of IPTAs                         : 4
Number of clocks                        : 6
Has stopwatches?                        : false
L/U subclass                            : U-PTA
Has silent actions?                     : true
Is strongly deterministic?              : true
Number of parameters                    : 1
Number of discrete variables            : 0
Number of actions                       : 15
Total number of locations               : 17
Average locations per IPTA              : 4.2
Total number of transitions             : 54
Average transitions per IPTA            : 13.5
------------------------------------------------------------

BEGIN CONSTRAINT
 p0 >= 20
END CONSTRAINT

------------------------------------------------------------
Constraint soundness                    : exact
Termination                             : regular termination
Constraint nature                       : good
------------------------------------------------------------
Number of states                        : 1264
Number of transitions                   : 1582
Number of computed states               : 1583
Total computation time                  : 2.600 seconds
States/second in state space            : 486.0 (1264/2.600 seconds)
Computed states/second                  : 608.7 (1583/2.600 seconds)
Estimated memory                        : 63.831 MiB (i.e., 8366458 words of size 8)
------------------------------------------------------------

------------------------------------------------------------
 Statistics: Algorithm counters
------------------------------------------------------------
main algorithm + parsing                : 2.603 seconds
main algorithm                          : 2.600 seconds
------------------------------------------------------------
 Statistics: Parsing counters
------------------------------------------------------------
model parsing and converting            : 0.002 second
------------------------------------------------------------
 Statistics: State computation counters
------------------------------------------------------------
number of state comparisons             : 153177
number of constraints comparisons       : 153177
number of new states <= old             : 319
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
total                                   : 2.603 seconds
------------------------------------------------------------