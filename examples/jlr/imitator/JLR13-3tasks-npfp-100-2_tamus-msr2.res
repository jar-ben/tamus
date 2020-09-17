(************************************************************
 * Result output by IMITATOR
 * Version  : IMITATOR 2.12.1 "Butter Lobster" (build 3061)
 * Git      : master/4e8b1c8
 * Model    : 'benchmarks/Scheduling/non-preemptive-scheduling/JLR13-3tasks-npfp-100-2_tamus-msr.imi'
 * Generated: Wed Sep 16, 2020 22:07:01
 * Command  : ./bin/imitator benchmarks/Scheduling/non-preemptive-scheduling/JLR13-3tasks-npfp-100-2_tamus-msr.imi -mode EFunsafe -incl -output-result -time-limit 1200 -counterexample
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
Constraint soundness                    : possible under-approximation
Termination                             : terminated after reaching a target state (some states may have been unexplored)
Constraint nature                       : good
------------------------------------------------------------
Number of states                        : 100
Number of transitions                   : 111
Number of computed states               : 112
Total computation time                  : 0.075 second
States/second in state space            : 1327.4 (100/0.075 second)
Computed states/second                  : 1486.6 (112/0.075 second)
Estimated memory                        : 5.058 MiB (i.e., 662972 words of size 8)
------------------------------------------------------------

------------------------------------------------------------
 Statistics: Algorithm counters
------------------------------------------------------------
main algorithm + parsing                : 0.080 second
main algorithm                          : 0.075 second
------------------------------------------------------------
 Statistics: Parsing counters
------------------------------------------------------------
model parsing and converting            : 0.004 second
------------------------------------------------------------
 Statistics: State computation counters
------------------------------------------------------------
number of state comparisons             : 556
number of constraints comparisons       : 556
number of new states <= old             : 12
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
total                                   : 0.080 second
------------------------------------------------------------