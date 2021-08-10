(************************************************************
 * Result by: IMITATOR 3.1-beta "Cheese Artichoke" (build master/e4be7d7)
 * Model    : 'tamus_examples/rcp/RCP_tamus.imi'
 * Generated: Tue Aug 10, 2021 01:53:27
 * Command  : imitator tamus_examples/rcp/RCP_tamus.imi tamus_examples/rcp/RCP_tamus_witness.imiprop
 ************************************************************)


------------------------------------------------------------
Number of IPTAs                         : 5
Number of clocks                        : 6
Has invariants?                         : true
Has clocks with rate <>1?               : false
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
 p34 >= 0
& p7 + p8 + p9 + p29 >= 74
& p24 >= 0
& p11 + p17 + p22 + p44 >= 107
& p45 >= 0
& p7 >= 0
& p44 >= 0
& p11 + p22 + p36 + p44 >= 101
& p17 >= 0
& p8 + p9 + p29 + p34 >= 44
& p36 >= 0
& p9 >= 0
& p11 >= 0
& p9 + p11 >= 52
& p29 >= 0
& p29 + p45 >= 129
& p8 >= 0
& p24 + p29 >= 125
& p29 + p44 >= 129
& p22 >= 0
& p19 >= 0
& p46 >= 0
& p47 >= 0
& p43 >= 0
& p42 >= 0
& p41 >= 0
& p40 >= 0
& p39 >= 0
& p38 >= 0
& p37 >= 0
& p35 >= 0
& p33 >= 0
& p32 >= 0
& p31 >= 0
& p30 >= 0
& p28 >= 0
& p27 >= 0
& p26 >= 0
& p25 >= 0
& p23 >= 0
& p21 >= 0
& p20 >= 0
& p18 >= 0
& p16 >= 0
& p15 >= 0
& p14 >= 0
& p13 >= 0
& p12 >= 0
& p10 >= 0
& p6 >= 0
& p5 >= 0
& p4 >= 0
& p3 >= 0
& p2 >= 0
& p1 >= 0
& p0 >= 0
END CONSTRAINT

------------------------------------------------------------
Constraint soundness                    : possible under-approximation
Termination                             : terminated after reaching a target state (some states may have been unexplored)
Constraint nature                       : good
------------------------------------------------------------
Number of states                        : 340
Number of transitions                   : 479
Number of computed states               : 480
Total computation time                  : 34.236 seconds
States/second in state space            : 9.9 (340/34.236 seconds)
Computed states/second                  : 14.0 (480/34.236 seconds)
Estimated memory                        : 24.421 MiB (i.e., 3200931 words of size 8)
------------------------------------------------------------

------------------------------------------------------------
 Statistics: Algorithm counters
------------------------------------------------------------
main algorithm + parsing                : 34.303 seconds
main algorithm                          : 34.237 seconds
------------------------------------------------------------
 Statistics: Parsing counters
------------------------------------------------------------
model parsing and converting            : 0.065 second
------------------------------------------------------------
 Statistics: State computation counters
------------------------------------------------------------
number of state comparisons             : 2256
number of constraints comparisons       : 2256
number of new states <= old             : 20
number of new states >= old             : 0
StateSpace.merging attempts             : 3131
StateSpace.merges                       : 120
------------------------------------------------------------
 Statistics: Graphics-related counters
------------------------------------------------------------
state space drawing                     : 0.000 second
------------------------------------------------------------
 Statistics: Global counter
------------------------------------------------------------
total                                   : 34.310 seconds
------------------------------------------------------------