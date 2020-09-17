(************************************************************
 * Result output by IMITATOR
 * Version  : IMITATOR 2.12.1 "Butter Lobster" (build 3061)
 * Git      : master/4e8b1c8
 * Model    : 'benchmarks/Scheduling/non-preemptive-scheduling/JLR13-3tasks-npfp-100-2_tamus.imi'
 * Generated: Wed Sep 16, 2020 20:56:53
 * Command  : ./bin/imitator benchmarks/Scheduling/non-preemptive-scheduling/JLR13-3tasks-npfp-100-2_tamus.imi -mode EFunsafe -incl -output-result -time-limit 1200 -counterexample
 ************************************************************)


------------------------------------------------------------
Number of IPTAs                         : 4
Number of clocks                        : 6
Has stopwatches?                        : false
L/U subclass                            : U-PTA
Has silent actions?                     : true
Is strongly deterministic?              : true
Number of parameters                    : 36
Number of discrete variables            : 0
Number of actions                       : 15
Total number of locations               : 17
Average locations per IPTA              : 4.2
Total number of transitions             : 54
Average transitions per IPTA            : 13.5
------------------------------------------------------------

BEGIN CONSTRAINT
 p38 >= 0
& p37 >= 0
& p36 >= 0
& p35 >= 0
& p34 >= 0
& p33 >= 0
& p32 >= 0
& p31 >= 0
& p30 >= 0
& p29 >= 0
& p28 >= 0
& p27 >= 0
& p26 >= 0
& p25 >= 0
& p24 >= 0
& p23 >= 0
& p22 >= 0
& p21 >= 0
& p20 >= 0
& p19 >= 0
& p18 >= 0
& p17 >= 0
& p16 >= 0
& p15 >= 0
& p14 >= 0
& p13 > 80
& p12 >= 0
& p11 >= 0
& p10 >= 0
& p9 >= 0
& p8 >= 0
& p7 >= 0
& p6 >= 0
& p5 >= 0
& p4 >= 80
& p0 >= 0
END CONSTRAINT

------------------------------------------------------------
Constraint soundness                    : possible under-approximation
Termination                             : terminated after reaching a target state (some states may have been unexplored)
Constraint nature                       : good
------------------------------------------------------------
Number of states                        : 3
Number of transitions                   : 2
Number of computed states               : 3
Total computation time                  : 0.013 second
States/second in state space            : 224.5 (3/0.013 second)
Computed states/second                  : 224.5 (3/0.013 second)
Estimated memory                        : 3.673 MiB (i.e., 481515 words of size 8)
------------------------------------------------------------

------------------------------------------------------------
 Statistics: Algorithm counters
------------------------------------------------------------
main algorithm + parsing                : 0.057 second
main algorithm                          : 0.013 second
------------------------------------------------------------
 Statistics: Parsing counters
------------------------------------------------------------
model parsing and converting            : 0.044 second
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
total                                   : 0.058 second
------------------------------------------------------------