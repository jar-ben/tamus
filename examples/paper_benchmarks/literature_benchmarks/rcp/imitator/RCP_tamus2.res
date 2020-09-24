(************************************************************
 * Result output by IMITATOR
 * Version  : IMITATOR 2.12.1 "Butter Lobster" (build 3061)
 * Git      : master/4e8b1c8
 * Model    : 'benchmarks/RCP/RCP_tamus.imi'
 * Generated: Wed Sep 16, 2020 20:55:05
 * Command  : ./bin/imitator benchmarks/RCP/RCP_tamus.imi -mode EFunsafe -incl -output-result -time-limit 1200 -counterexample
 ************************************************************)


------------------------------------------------------------
Number of IPTAs                         : 5
Number of clocks                        : 6
Has stopwatches?                        : false
L/U subclass                            : U-PTA
Has silent actions?                     : false
Is strongly deterministic?              : false
Number of parameters                    : 48
Number of discrete variables            : 0
Number of actions                       : 16
Total number of locations               : 48
Average locations per IPTA              : 9.6
Total number of transitions             : 98
Average transitions per IPTA            : 19.6
------------------------------------------------------------

BEGIN CONSTRAINT
 p3 >= 0
& p40 >= 0
& p8 >= 0
& p36 >= 0
& p47 >= 0
& p37 >= 0
& p18 >= 0
& p45 >= 0
& p26 >= 0
& p18 + p26 >= 52
& p26 + p45 >= 107
& p14 + p47 >= 257
& p26 + p40 >= 131
& p8 + p26 >= 137
& p3 + p14 >= 120
& p14 >= 0
& p14 + p36 >= 281
& p14 + p37 >= 281
& p44 >= 0
& p43 >= 0
& p42 >= 0
& p41 >= 0
& p39 >= 0
& p38 >= 0
& p46 >= 0
& p35 >= 0
& p34 >= 0
& p33 >= 0
& p32 >= 0
& p31 >= 0
& p30 >= 0
& p29 >= 0
& p28 >= 0
& p27 >= 0
& p25 >= 0
& p24 >= 0
& p23 >= 0
& p22 >= 0
& p21 >= 0
& p20 >= 0
& p19 >= 0
& p17 >= 0
& p16 >= 0
& p15 >= 0
& p13 >= 0
& p12 >= 0
& p11 >= 0
& p10 >= 0
& p9 >= 0
& p7 >= 0
& p6 >= 0
& p5 >= 0
& p4 >= 0
& p2 >= 0
& p1 >= 0
& p0 >= 0
END CONSTRAINT

------------------------------------------------------------
Constraint soundness                    : possible under-approximation
Termination                             : terminated after reaching a target state (some states may have been unexplored)
Constraint nature                       : good
------------------------------------------------------------
Number of states                        : 935
Number of transitions                   : 1100
Number of computed states               : 1101
Total computation time                  : 24.117 seconds
States/second in state space            : 38.7 (935/24.117 seconds)
Computed states/second                  : 45.6 (1101/24.117 seconds)
Estimated memory                        : 77.291 MiB (i.e., 10130690 words of size 8)
------------------------------------------------------------

------------------------------------------------------------
 Statistics: Algorithm counters
------------------------------------------------------------
main algorithm + parsing                : 24.238 seconds
main algorithm                          : 24.131 seconds
------------------------------------------------------------
 Statistics: Parsing counters
------------------------------------------------------------
model parsing and converting            : 0.107 second
------------------------------------------------------------
 Statistics: State computation counters
------------------------------------------------------------
number of state comparisons             : 16290
number of constraints comparisons       : 13735
number of new states <= old             : 166
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
total                                   : 24.242 seconds
------------------------------------------------------------