(************************************************************
 * Result output by IMITATOR
 * Version  : IMITATOR 2.12.1 "Butter Lobster" (build 3061)
 * Git      : master/4e8b1c8
 * Model    : 'benchmarks/Scheduling/non-preemptive-scheduling/JLR13-3tasks-npfp-100-2_tamus.imi'
 * Generated: Mon Sep 14, 2020 22:08:15
 * Command  : ./bin/imitator benchmarks/Scheduling/non-preemptive-scheduling/JLR13-3tasks-npfp-100-2_tamus.imi -mode EFunsafe -incl -output-result -time-limit 1200
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
 p38 >= 80
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
& p19 > 80
& p18 >= 0
& p17 >= 0
& p16 >= 0
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
& p5 >= 0
& p4 >= 0
& p0 >= 0
OR
  p22 >= 0
& p13 >= 0
& p13 + p36 > 52
& p4 >= 0
& p4 + p36 >= 52
& p36 >= 0
& p38 >= 0
& p37 >= 0
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
& p21 >= 0
& p20 >= 0
& p19 >= 0
& p18 >= 0
& p17 >= 0
& p16 >= 0
& p15 >= 0
& p14 >= 0
& p12 >= 0
& p11 >= 0
& p10 >= 0
& p9 >= 0
& p8 >= 0
& p7 >= 0
& p6 >= 0
& p5 >= 0
& p0 >= 0
OR
  p38 >= 80
& p37 >= 0
& p36 >= 0
& p35 >= 0
& p34 >= 0
& p33 >= 0
& p32 >= 0
& p31 > 80
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
& p13 >= 0
& p12 >= 0
& p11 >= 0
& p10 >= 0
& p9 >= 80
& p8 >= 0
& p7 >= 0
& p6 >= 0
& p5 >= 0
& p4 >= 0
& p0 >= 0
OR
  p22 >= 0
& p21 >= 0
& p21 + p36 > 52
& p4 >= 0
& p0 >= 0
& p0 + p36 >= 52
& p4 + p36 >= 52
& p36 >= 0
& p38 >= 0
& p37 >= 0
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
& p20 >= 0
& p19 >= 0
& p18 >= 0
& p17 >= 0
& p16 >= 0
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
& p5 >= 0
OR
  p38 >= 0
& p14 >= 0
& p18 >= 0
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
& p17 >= 0
& p16 >= 0
& p15 >= 0
& p13 >= 0
& p12 >= 0
& p11 >= 0
& p10 >= 0
& p9 >= 0
& p8 >= 0
& p7 >= 72
& p6 >= 0
& p5 >= 0
& p4 >= 0
& p0 >= 0
OR
  p5 + p38 >= 52
& p21 >= 0
& p0 >= 0
& p10 >= 0
& p6 >= 0
& p0 + p10 >= 52
& p10 + p21 > 52
& p5 >= 0
& p10 + p38 >= 52
& p18 >= 0
& p0 + p10 + p38 >= 132
& p10 + p21 + p38 > 132
& p6 + p38 >= 52
& p38 >= 0
& p32 >= 0
& p37 >= 0
& p36 >= 0
& p35 >= 0
& p34 >= 0
& p33 >= 0
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
& p20 >= 0
& p19 >= 0
& p17 >= 0
& p16 >= 0
& p15 >= 0
& p14 >= 0
& p13 >= 0
& p12 >= 0
& p11 >= 0
& p9 >= 0
& p8 >= 0
& p7 >= 0
& p4 >= 0
OR
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
& p21 > 80
& p20 >= 0
& p19 >= 0
& p18 >= 0
& p17 >= 0
& p16 >= 0
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
& p5 >= 0
& p4 >= 0
& p0 >= 80
OR
  p5 + p38 >= 52
& p21 >= 0
& p0 >= 0
& p10 >= 0
& p36 >= 0
& p0 + p10 >= 52
& p10 + p21 > 52
& p5 >= 0
& p10 + p38 >= 52
& p18 >= 0
& p0 + p10 + p38 >= 132
& p10 + p21 + p38 > 132
& p36 + p38 >= 52
& p38 >= 0
& p32 >= 0
& p37 >= 0
& p35 >= 0
& p34 >= 0
& p33 >= 0
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
& p20 >= 0
& p19 >= 0
& p17 >= 0
& p16 >= 0
& p15 >= 0
& p14 >= 0
& p13 >= 0
& p12 >= 0
& p11 >= 0
& p9 >= 0
& p8 >= 0
& p7 >= 0
& p6 >= 0
& p4 >= 0
END CONSTRAINT

------------------------------------------------------------
Constraint soundness                    : possible under-approximation
Termination                             : time limit (29 successors unexplored)
Constraint nature                       : good
------------------------------------------------------------
Number of states                        : 150
Number of transitions                   : 168
Number of computed states               : 169
Total computation time                  : 1638.205 seconds
States/second in state space            : 0.0 (150/1638.205 seconds)
Computed states/second                  : 0.1 (169/1638.205 seconds)
Estimated memory                        : 12.776 MiB (i.e., 1674581 words of size 8)
------------------------------------------------------------

------------------------------------------------------------
 Statistics: Algorithm counters
------------------------------------------------------------
main algorithm + parsing                : 1638.240 seconds
main algorithm                          : 1638.205 seconds
------------------------------------------------------------
 Statistics: Parsing counters
------------------------------------------------------------
model parsing and converting            : 0.034 second
------------------------------------------------------------
 Statistics: State computation counters
------------------------------------------------------------
number of state comparisons             : 1399
number of constraints comparisons       : 1399
number of new states <= old             : 19
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
total                                   : 1638.302 seconds
------------------------------------------------------------