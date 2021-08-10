(************************************************************
 * Result by: IMITATOR 3.1-beta "Cheese Artichoke" (build master/e4be7d7)
 * Model    : 'tamus_examples/generator_examples/3/3-18-2.imi'
 * Generated: Tue Aug 10, 2021 03:02:21
 * Command  : imitator tamus_examples/generator_examples/3/3-18-2.imi tamus_examples/generator_examples/3/3-18-2_witness.imiprop
 ************************************************************)


------------------------------------------------------------
Number of IPTAs                         : 1
Number of clocks                        : 3
Has invariants?                         : true
Has clocks with rate <>1?               : false
L/U subclass                            : U-PTA
Has silent actions?                     : false
Is strongly deterministic?              : true
Number of parameters                    : 24
Number of discrete variables            : 0
Number of actions                       : 38
Total number of locations               : 38
Average locations per IPTA              : 38.0
Total number of transitions             : 38
Average transitions per IPTA            : 38.0
------------------------------------------------------------

BEGIN CONSTRAINT
 p0 + p2 + p3 + p7 + p8 + p10 + p12 + p13 + p14 >= 26
& p0 + p2 + p7 + p10 + p12 + p13 + p14 >= 4
& p0 + p2 + p3 + p5 + p8 + p10 + p13 >= 4
& p0 + p2 + p3 + p5 + p10 + p12 + p13 + p14 >= 15
& p0 + p2 + p5 + p7 + p8 + p12 + p13 + p14 >= 15
& p2 + p5 + p7 + p8 + p12 + p13 + p14 >= 4
& p0 + p3 + p7 + p8 + p10 + p12 + p13 >= 4
& p0 + p2 + p7 + p8 + p10 + p13 + p14 >= 4
& p0 + p3 + p5 + p7 + p8 + p10 + p12 + p13 >= 15
& p0 + p2 + p3 + p5 + p7 + p8 + p12 + p13 >= 15
& p0 + p2 + p7 + p8 + p12 + p13 + p14 >= 4
& p2 + p3 + p5 + p7 + p8 + p10 + p13 >= 4
& p0 + p3 + p5 + p7 + p8 + p12 + p13 >= 4
& p2 + p3 + p5 + p7 + p8 + p12 + p13 >= 4
& p0 + p1 + p2 + p3 + p4 >= 3
& p0 + p2 + p3 + p5 + p8 + p10 + p13 + p14 >= 15
& p0 + p2 + p3 + p5 + p12 + p13 + p14 >= 4
& p0 + p5 + p7 + p8 + p10 + p12 + p13 >= 4
& p2 + p3 + p5 + p8 + p10 + p12 + p13 >= 4
& p0 + p2 + p5 + p8 + p10 + p12 + p13 >= 4
& p2 + p3 + p5 + p10 + p12 + p13 + p14 >= 4
& p2 + p3 + p8 + p10 + p12 + p13 + p14 >= 4
& p0 + p2 + p3 + p7 + p8 + p10 + p13 >= 4
& p0 + p2 + p3 + p5 + p8 + p13 + p14 >= 4
& p0 + p2 + p7 + p8 + p10 + p12 + p13 + p14 >= 15
& p0 + p2 + p3 + p7 + p8 + p12 + p13 + p14 >= 15
& p2 + p3 + p5 + p7 + p10 + p12 + p13 >= 4
& p2 + p5 + p7 + p8 + p10 + p12 + p13 >= 4
& p0 + p2 + p7 + p8 + p10 + p12 + p13 >= 4
& p0 + p2 + p5 + p7 + p10 + p12 + p13 + p14 >= 15
& p0 + p5 + p8 + p10 + p12 + p13 + p14 >= 4
& p0 + p2 + p3 + p7 + p10 + p12 + p13 >= 4
& p0 + p2 + p3 + p8 + p12 + p13 + p14 >= 4
& p0 + p2 + p3 + p5 + p10 + p12 + p13 >= 4
& p0 + p3 + p5 + p7 + p8 + p10 + p13 >= 4
& p0 + p3 + p8 + p10 + p12 + p13 + p14 >= 4
& p2 + p3 + p5 + p8 + p12 + p13 + p14 >= 4
& p2 + p5 + p7 + p10 + p12 + p13 + p14 >= 4
& p0 + p3 + p7 + p10 + p12 + p13 + p14 >= 4
& p2 + p5 + p7 + p8 + p10 + p13 + p14 >= 4
& p0 + p2 + p5 + p7 + p10 + p13 + p14 >= 4
& p0 + p2 + p3 + p5 + p8 + p12 + p13 >= 4
& p0 + p3 + p5 + p8 + p10 + p12 + p13 >= 4
& p0 + p2 + p5 + p8 + p12 + p13 + p14 >= 4
& p0 + p2 + p3 + p5 + p7 + p10 + p13 >= 4
& p0 + p2 + p5 + p7 + p8 + p12 + p13 >= 4
& p0 + p2 + p3 + p5 + p7 + p12 + p13 >= 4
& p0 + p2 + p3 + p7 + p10 + p13 + p14 >= 4
& p0 + p3 + p5 + p7 + p10 + p13 + p14 >= 4
& p2 + p7 + p8 + p10 + p12 + p13 + p14 >= 4
& p0 + p2 + p3 + p7 + p12 + p13 + p14 >= 4
& p0 + p2 + p3 + p7 + p10 + p12 + p13 + p14 >= 15
& p0 + p3 + p5 + p10 + p12 + p13 + p14 >= 4
& p2 + p3 + p7 + p10 + p12 + p13 + p14 >= 4
& p0 + p2 + p3 + p5 + p7 + p10 + p12 + p13 >= 15
& p0 + p2 + p3 + p5 + p7 + p8 + p13 >= 4
& p0 + p3 + p5 + p8 + p10 + p13 + p14 >= 4
& p0 + p2 + p3 + p7 + p8 + p10 + p13 + p14 >= 15
& p0 + p3 + p7 + p8 + p12 + p13 + p14 >= 4
& p0 + p3 + p5 + p7 + p8 + p13 + p14 >= 4
& p0 + p2 + p3 + p10 + p12 + p13 + p14 >= 4
& p2 + p3 + p5 + p8 + p10 + p13 + p14 >= 4
& p0 + p2 + p3 + p7 + p8 + p10 + p12 + p13 >= 15
& p0 + p3 + p5 + p7 + p12 + p13 + p14 >= 4
& p0 + p5 + p7 + p8 + p10 + p13 + p14 >= 4
& p0 + p2 + p3 + p5 + p7 + p8 + p10 + p13 >= 15
& p0 + p2 + p5 + p7 + p10 + p12 + p13 >= 4
& p0 + p2 + p3 + p5 + p8 + p12 + p13 + p14 >= 15
& p0 + p2 + p3 + p8 + p10 + p12 + p13 >= 4
& p3 + p5 + p7 + p8 + p10 + p13 + p14 >= 4
& p0 + p2 + p5 + p10 + p12 + p13 + p14 >= 4
& p0 + p2 + p5 + p7 + p8 + p13 + p14 >= 4
& p0 + p2 + p5 + p7 + p8 + p10 + p13 + p14 >= 15
& p0 + p2 + p8 + p10 + p12 + p13 + p14 >= 4
& p0 + p2 + p3 + p5 + p8 + p10 + p12 + p13 >= 15
& p0 + p2 + p5 + p7 + p8 + p10 + p13 >= 4
& p2 + p3 + p5 + p7 + p10 + p13 + p14 >= 4
& p2 + p3 + p5 + p7 + p10 + p12 + p13 + p14 >= 15
& p0 + p2 + p3 + p7 + p8 + p12 + p13 >= 4
& p0 + p2 + p3 + p5 + p10 + p13 + p14 >= 4
& p0 + p2 + p5 + p8 + p10 + p12 + p13 + p14 >= 15
& p0 + p2 + p3 + p8 + p10 + p12 + p13 + p14 >= 15
& p0 + p2 + p3 + p5 + p7 + p10 + p13 + p14 >= 15
& p2 + p3 + p5 + p7 + p8 + p10 + p12 + p13 >= 15
& p2 >= 0
& p0 + p5 + p7 + p8 + p12 + p13 + p14 >= 4
& p0 + p2 + p3 + p5 + p7 + p8 + p10 + p12 + p13 >= 26
& p0 + p2 + p3 + p5 + p7 + p10 + p12 + p13 + p14 >= 26
& p0 + p2 + p3 + p5 + p7 + p12 + p13 + p14 >= 15
& p3 + p5 + p7 + p10 + p12 + p13 + p14 >= 4
& p2 + p3 + p7 + p8 + p10 + p13 + p14 >= 4
& p0 + p3 + p5 + p8 + p10 + p12 + p13 + p14 >= 15
& p2 + p3 + p5 + p8 + p10 + p12 + p13 + p14 >= 15
& p0 + p2 + p5 + p7 + p8 + p10 + p12 + p13 >= 15
& p3 + p5 + p8 + p10 + p12 + p13 + p14 >= 4
& p0 + p3 + p7 + p8 + p10 + p13 + p14 >= 4
& p2 + p3 + p5 + p7 + p8 + p12 + p13 + p14 >= 15
& p0 >= 0
& p3 >= 0
& p0 + p2 + p3 + p5 + p7 + p8 + p10 + p13 + p14 >= 26
& p0 + p3 + p5 + p7 + p10 + p12 + p13 + p14 >= 15
& p2 + p3 + p5 + p7 + p12 + p13 + p14 >= 4
& p0 + p2 + p3 + p7 + p8 + p13 + p14 >= 4
& p0 + p3 + p5 + p7 + p8 + p12 + p13 + p14 >= 15
& p0 + p2 + p3 + p5 + p7 + p8 + p12 + p13 + p14 >= 26
& p2 + p3 + p7 + p8 + p10 + p12 + p13 >= 4
& p3 + p5 + p7 + p8 + p12 + p13 + p14 >= 4
& p0 + p3 + p7 + p8 + p10 + p12 + p13 + p14 >= 15
& p0 + p2 + p5 + p7 + p12 + p13 + p14 >= 4
& p3 + p7 + p8 + p10 + p12 + p13 + p14 >= 4
& p0 + p2 + p5 + p8 + p10 + p13 + p14 >= 4
& p0 + p3 + p5 + p7 + p8 + p10 + p13 + p14 >= 15
& p2 + p5 + p8 + p10 + p12 + p13 + p14 >= 4
& p0 + p7 + p8 + p10 + p12 + p13 + p14 >= 4
& p0 + p2 + p3 + p5 + p7 + p8 + p13 + p14 >= 15
& p0 + p5 + p7 + p10 + p12 + p13 + p14 >= 4
& p0 + p3 + p5 + p8 + p12 + p13 + p14 >= 4
& p2 + p3 + p7 + p8 + p10 + p12 + p13 + p14 >= 15
& p2 + p3 + p7 + p8 + p12 + p13 + p14 >= 4
& p0 + p2 + p3 + p8 + p10 + p13 + p14 >= 4
& p2 + p3 + p5 + p7 + p8 + p10 + p13 + p14 >= 15
& p0 + p2 + p3 + p5 + p8 + p10 + p12 + p13 + p14 >= 26
& p0 + p3 + p5 + p7 + p10 + p12 + p13 >= 4
& p2 + p3 + p5 + p7 + p8 + p13 + p14 >= 4
& p0 + p2 + p3 + p5 + p7 + p13 + p14 >= 4
& p5 >= 0
& p3 + p5 + p7 + p8 + p10 + p12 + p13 >= 4
& p0 + p5 + p7 + p8 + p10 + p12 + p13 + p14 >= 15
& p5 + p7 + p8 + p10 + p12 + p13 + p14 >= 4
& p5 + p6 + p7 + p8 + p9 >= 3
& p8 >= 0
& p7 >= 0
& p0 + p2 + p5 + p7 + p8 + p10 + p12 + p13 + p14 >= 26
& p0 + p3 + p5 + p7 + p8 + p10 + p12 + p13 + p14 >= 26
& p2 + p3 + p5 + p7 + p8 + p10 + p12 + p13 + p14 >= 26
& p3 + p5 + p7 + p8 + p10 + p12 + p13 + p14 >= 15
& p0 + p2 + p3 + p5 + p7 + p8 + p10 + p12 + p13 + p14 >= 37
& p2 + p5 + p7 + p8 + p10 + p12 + p13 + p14 >= 15
& p10 + p11 + p12 + p14 + p15 >= 3
& p10 >= 0
& p14 >= 0
& p12 >= 0
& p11 >= 0
& p15 >= 0
& p13 >= 0
& p9 >= 0
& p6 >= 0
& p1 >= 0
& p4 >= 0
& p22 >= 0
& p21 >= 0
& p20 >= 0
& p19 >= 0
& p18 >= 0
& p17 >= 0
& p16 >= 0
& p23 >= 0
END CONSTRAINT

------------------------------------------------------------
Constraint soundness                    : possible under-approximation
Termination                             : terminated after reaching a target state (some states may have been unexplored)
Constraint nature                       : good
------------------------------------------------------------
Number of states                        : 38
Number of transitions                   : 37
Number of computed states               : 38
Total computation time                  : 241.547 seconds
States/second in state space            : 0.1 (38/241.547 seconds)
Computed states/second                  : 0.1 (38/241.547 seconds)
Estimated memory                        : 5.434 MiB (i.e., 712323 words of size 8)
------------------------------------------------------------

------------------------------------------------------------
 Statistics: Algorithm counters
------------------------------------------------------------
main algorithm + parsing                : 241.557 seconds
main algorithm                          : 241.548 seconds
------------------------------------------------------------
 Statistics: Parsing counters
------------------------------------------------------------
model parsing and converting            : 0.009 second
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
total                                   : 374.460 seconds
------------------------------------------------------------