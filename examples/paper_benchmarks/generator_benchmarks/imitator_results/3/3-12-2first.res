(************************************************************
 * Result output by IMITATOR
 * Version  : IMITATOR 2.12.1 "Butter Lobster" (build 3061)
 * Git      : master/4e8b1c8
 * Model    : 'benchmarks/generator_examples/3-12-2.imi'
 * Generated: Sun Sep 13, 2020 18:11:05
 * Command  : ./bin/imitator benchmarks/generator_examples/3-12-2.imi -mode EFunsafe -incl -output-result
 ************************************************************)


------------------------------------------------------------
Number of IPTAs                         : 1
Number of clocks                        : 3
Has stopwatches?                        : false
L/U subclass                            : U-PTA
Has silent actions?                     : false
Is strongly deterministic?              : true
Number of parameters                    : 17
Number of discrete variables            : 0
Number of actions                       : 26
Total number of locations               : 26
Average locations per IPTA              : 26.0
Total number of transitions             : 26
Average transitions per IPTA            : 26.0
------------------------------------------------------------

BEGIN CONSTRAINT
 p3 >= 0
& p0 + p2 + p3 + p5 + p8 >= 6
& p0 + p3 + p5 + p8 + p9 >= 6
& p0 >= 0
& p0 + p3 + p7 + p8 + p9 >= 6
& p0 + p3 + p5 + p7 + p8 >= 6
& p0 + p2 + p7 + p8 + p9 >= 6
& p0 + p1 + p2 + p3 + p4 >= 3
& p0 + p5 + p7 + p8 + p9 >= 6
& p0 + p2 + p3 + p8 + p9 >= 6
& p0 + p2 + p5 + p7 + p8 + p9 >= 17
& p0 + p2 + p3 + p7 + p8 >= 6
& p0 + p2 + p3 + p5 + p8 + p9 >= 17
& p2 >= 0
& p0 + p2 + p3 + p7 + p8 + p9 >= 17
& p0 + p2 + p5 + p8 + p9 >= 6
& p2 + p3 + p5 + p8 + p9 >= 6
& p2 + p3 + p5 + p7 + p8 >= 6
& p0 + p2 + p5 + p7 + p8 >= 6
& p0 + p2 + p3 + p5 + p7 + p8 >= 17
& p2 + p3 + p7 + p8 + p9 >= 6
& p2 + p5 + p7 + p8 + p9 >= 6
& p3 + p5 + p7 + p8 + p9 >= 6
& p0 + p2 + p3 + p5 + p7 + p8 + p9 >= 28
& p5 + p6 + p7 + p9 + p10 >= 3
& p5 >= 0
& p2 + p3 + p5 + p7 + p8 + p9 >= 17
& p0 + p3 + p5 + p7 + p8 + p9 >= 17
& p9 >= 0
& p7 >= 0
& p6 >= 0
& p10 >= 0
& p8 >= 0
& p1 >= 0
& p4 >= 0
& p15 >= 0
& p14 >= 0
& p13 >= 0
& p12 >= 0
& p11 >= 0
& p16 >= 0
OR
  p11 + p13 + p15 + p16 >= 13
& p11 >= 0
& p16 >= 0
& p13 >= 0
& p15 >= 0
& p12 >= 0
& p14 >= 0
& p10 >= 0
& p9 >= 0
& p8 >= 0
& p7 >= 0
& p6 >= 0
& p5 >= 0
& p4 >= 0
& p3 >= 0
& p2 >= 0
& p1 >= 0
& p0 >= 0
END CONSTRAINT

------------------------------------------------------------
Constraint soundness                    : exact
Termination                             : regular termination
Constraint nature                       : good
------------------------------------------------------------
Number of states                        : 27
Number of transitions                   : 26
Number of computed states               : 27
Total computation time                  : 0.485 second
States/second in state space            : 55.6 (27/0.485 second)
Computed states/second                  : 55.6 (27/0.485 second)
Estimated memory                        : 3.601 MiB (i.e., 472052 words of size 8)
------------------------------------------------------------

------------------------------------------------------------
 Statistics: Algorithm counters
------------------------------------------------------------
main algorithm + parsing                : 0.492 second
main algorithm                          : 0.485 second
------------------------------------------------------------
 Statistics: Parsing counters
------------------------------------------------------------
model parsing and converting            : 0.007 second
------------------------------------------------------------
 Statistics: State computation counters
------------------------------------------------------------
number of state comparisons             : 1
number of constraints comparisons       : 1
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
total                                   : 0.496 second
------------------------------------------------------------