(************************************************************
 * Result output by IMITATOR
 * Version  : IMITATOR 2.12.1 "Butter Lobster" (build 3061)
 * Git      : master/4e8b1c8
 * Model    : 'benchmarks/WFAS/WFAS_tamus.imi'
 * Generated: Wed Sep 16, 2020 22:13:32
 * Command  : ./bin/imitator benchmarks/WFAS/WFAS_tamus.imi -mode EFunsafe -incl -output-result -time-limit 1200 -counterexample
 ************************************************************)


------------------------------------------------------------
Number of IPTAs                         : 3
Number of clocks                        : 4
Has stopwatches?                        : false
L/U subclass                            : U-PTA
Has silent actions?                     : true
Is strongly deterministic?              : false
Number of parameters                    : 24
Number of discrete variables            : 0
Number of actions                       : 10
Total number of locations               : 10
Average locations per IPTA              : 3.3
Total number of transitions             : 23
Average transitions per IPTA            : 7.6
------------------------------------------------------------

BEGIN CONSTRAINT
 p5 + p12 > 0
& p11 >= 0
& p8 + p12 > 0
& p8 >= 0
& p5 >= 0
& p6 >= 0
& p4 >= 0
& p24 >= 0
& p7 >= 0
& p25 >= 0
& p12 >= 0
& p26 >= 0
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
& p13 >= 0
& p10 >= 0
& p9 >= 0
& p3 >= 0
END CONSTRAINT

------------------------------------------------------------
Constraint soundness                    : possible under-approximation
Termination                             : terminated after reaching a target state (some states may have been unexplored)
Constraint nature                       : good
------------------------------------------------------------
Number of states                        : 7
Number of transitions                   : 6
Number of computed states               : 7
Total computation time                  : 0.018 second
States/second in state space            : 372.1 (7/0.018 second)
Computed states/second                  : 372.1 (7/0.018 second)
Estimated memory                        : 3.047 MiB (i.e., 399492 words of size 8)
------------------------------------------------------------

------------------------------------------------------------
 Statistics: Algorithm counters
------------------------------------------------------------
main algorithm + parsing                : 0.031 second
main algorithm                          : 0.018 second
------------------------------------------------------------
 Statistics: Parsing counters
------------------------------------------------------------
model parsing and converting            : 0.012 second
------------------------------------------------------------
 Statistics: State computation counters
------------------------------------------------------------
number of state comparisons             : 1
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
total                                   : 0.031 second
------------------------------------------------------------