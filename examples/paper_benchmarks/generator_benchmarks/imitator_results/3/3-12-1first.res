(************************************************************
 * Result output by IMITATOR
 * Version  : IMITATOR 2.12.1 "Butter Lobster" (build 3061)
 * Git      : master/4e8b1c8
 * Model    : 'benchmarks/generator_examples/3-12-1.imi'
 * Generated: Sun Sep 13, 2020 18:08:49
 * Command  : ./bin/imitator benchmarks/generator_examples/3-12-1.imi -mode EFunsafe -incl -output-result
 ************************************************************)


------------------------------------------------------------
Number of IPTAs                         : 1
Number of clocks                        : 3
Has stopwatches?                        : false
L/U subclass                            : U-PTA
Has silent actions?                     : false
Is strongly deterministic?              : true
Number of parameters                    : 11
Number of discrete variables            : 0
Number of actions                       : 13
Total number of locations               : 14
Average locations per IPTA              : 14.0
Total number of transitions             : 13
Average transitions per IPTA            : 13.0
------------------------------------------------------------

BEGIN CONSTRAINT
 p0 + p1 + p2 + p3 + p4 >= 3
& p0 >= 0
& p3 >= 0
& p2 >= 0
& p5 + p6 + p7 + p9 + p10 >= 3
& p5 >= 0
& p9 >= 0
& p7 >= 0
& p6 >= 0
& p10 >= 0
& p1 >= 0
& p4 >= 0
& p8 >= 0
END CONSTRAINT

------------------------------------------------------------
Constraint soundness                    : exact
Termination                             : regular termination
Constraint nature                       : good
------------------------------------------------------------
Number of states                        : 14
Number of transitions                   : 13
Number of computed states               : 14
Total computation time                  : 0.077 second
States/second in state space            : 181.3 (14/0.077 second)
Computed states/second                  : 181.3 (14/0.077 second)
Estimated memory                        : 2.580 MiB (i.e., 338239 words of size 8)
------------------------------------------------------------

------------------------------------------------------------
 Statistics: Algorithm counters
------------------------------------------------------------
main algorithm + parsing                : 0.080 second
main algorithm                          : 0.077 second
------------------------------------------------------------
 Statistics: Parsing counters
------------------------------------------------------------
model parsing and converting            : 0.002 second
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
total                                   : 0.081 second
------------------------------------------------------------