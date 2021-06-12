(************************************************************
 * Result by: IMITATOR 3.1-beta "Cheese Artichoke" (build master/e4be7d7)
 * Model    : 'tamus_examples/wfas/WFAS_tamus.imi'
 * Generated: Tue Jun 8, 2021 02:08:04
 * Command  : imitator tamus_examples/wfas/WFAS_tamus.imi tamus_examples/wfas/WFAS_tamus.imiprop
 ************************************************************)


------------------------------------------------------------
Number of IPTAs                         : 3
Number of clocks                        : 4
Has invariants?                         : true
Has clocks with rate <>1?               : false
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
Number of states                        : 53
Number of transitions                   : 56
Number of computed states               : 62
Total computation time                  : 16.470 seconds
States/second in state space            : 3.2 (53/16.470 seconds)
Computed states/second                  : 3.7 (62/16.470 seconds)
Estimated memory                        : 3.656 MiB (i.e., 479244 words of size 8)
------------------------------------------------------------

------------------------------------------------------------
 Statistics: Algorithm counters
------------------------------------------------------------
main algorithm + parsing                : 16.488 seconds
main algorithm                          : 16.470 seconds
------------------------------------------------------------
 Statistics: Parsing counters
------------------------------------------------------------
model parsing and converting            : 0.017 second
------------------------------------------------------------
 Statistics: State computation counters
------------------------------------------------------------
number of state comparisons             : 108
number of constraints comparisons       : 108
number of new states <= old             : 4
number of new states >= old             : 0
StateSpace.merging attempts             : 70
StateSpace.merges                       : 1
------------------------------------------------------------
 Statistics: Graphics-related counters
------------------------------------------------------------
state space drawing                     : 0.000 second
------------------------------------------------------------
 Statistics: Global counter
------------------------------------------------------------
total                                   : 16.504 seconds
------------------------------------------------------------