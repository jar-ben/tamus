(************************************************************
 * Result output by IMITATOR
 * Version  : IMITATOR 2.12.1 "Butter Lobster" (build 3061)
 * Git      : master/4e8b1c8
 * Model    : 'benchmarks/WFAS/WFAS_tamus.imi'
 * Generated: Mon Sep 14, 2020 19:44:20
 * Command  : ./bin/imitator benchmarks/WFAS/WFAS_tamus.imi -mode EFunsafe -incl -output-result -time-limit 1200
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
 2*p8 + 2*p12 + p19 + p25 > 0
& 2*p5 + 2*p12 + p19 + p25 > 0
& 2*p5 + 2*p12 + p25 + p26 > 0
& 2*p8 + 2*p12 + p25 + p26 > 0
& p26 >= 0
& p19 >= 0
& p25 >= 0
& p11 >= 0
& p8 >= 0
& p5 >= 0
& p6 >= 0
& p4 >= 0
& p24 >= 0
& p7 >= 0
& p12 >= 0
& p23 >= 0
& p22 >= 0
& p21 >= 0
& p20 >= 0
& p18 >= 0
& p17 >= 0
& p16 >= 0
& p15 >= 0
& p14 >= 0
& p13 >= 0
& p10 >= 0
& p9 >= 0
& p3 >= 0
OR
  p5 + p19 > 5
& p5 + p26 > 5
& p26 >= 0
& p19 >= 0
& p3 >= 0
& p16 >= 0
& p25 >= 0
& p24 >= 0
& p5 >= 0
& p20 >= 0
& p23 >= 0
& p22 >= 0
& p21 >= 0
& p18 >= 0
& p17 >= 0
& p15 >= 0
& p14 >= 0
& p13 >= 0
& p12 >= 0
& p11 >= 0
& p10 >= 0
& p9 >= 0
& p8 >= 0
& p7 >= 0
& p6 >= 0
& p4 >= 0
OR
  p5 >= 0
& p20 >= 0
& 2*p20 + p25 > 1
& p16 + 2*p20 > 1
& p6 >= 0
& p8 >= 0
& p13 >= 0
& p25 >= 0
& p16 >= 0
& p26 >= 0
& p19 >= 0
& p24 >= 0
& p23 >= 0
& p22 >= 0
& p21 >= 0
& p18 >= 0
& p17 >= 0
& p15 >= 0
& p14 >= 0
& p12 >= 0
& p11 >= 0
& p10 >= 0
& p9 >= 0
& p7 >= 0
& p4 >= 0
& p3 >= 0
END CONSTRAINT

------------------------------------------------------------
Constraint soundness                    : exact
Termination                             : regular termination
Constraint nature                       : good
------------------------------------------------------------
Number of states                        : 58
Number of transitions                   : 61
Number of computed states               : 62
Total computation time                  : 16.185 seconds
States/second in state space            : 3.5 (58/16.185 seconds)
Computed states/second                  : 3.8 (62/16.185 seconds)
Estimated memory                        : 5.144 MiB (i.e., 674298 words of size 8)
------------------------------------------------------------

------------------------------------------------------------
 Statistics: Algorithm counters
------------------------------------------------------------
main algorithm + parsing                : 16.200 seconds
main algorithm                          : 16.185 seconds
------------------------------------------------------------
 Statistics: Parsing counters
------------------------------------------------------------
model parsing and converting            : 0.013 second
------------------------------------------------------------
 Statistics: State computation counters
------------------------------------------------------------
number of state comparisons             : 183
number of constraints comparisons       : 112
number of new states <= old             : 4
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
total                                   : 16.214 seconds
------------------------------------------------------------