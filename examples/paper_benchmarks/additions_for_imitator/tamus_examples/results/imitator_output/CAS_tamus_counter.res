(************************************************************
 * Result by: IMITATOR 3.1-beta "Cheese Artichoke" (build master/e4be7d7)
 * Model    : 'tamus_examples/CAS/CAS_tamus.imi'
 * Generated: Tue Jun 8, 2021 00:27:43
 * Command  : imitator tamus_examples/CAS/CAS_tamus.imi tamus_examples/CAS/CAS_tamus_witness.imiprop
 ************************************************************)


------------------------------------------------------------
Number of IPTAs                         : 5
Number of clocks                        : 5
Has invariants?                         : true
Has clocks with rate <>1?               : false
L/U subclass                            : U-PTA
Has silent actions?                     : true
Is strongly deterministic?              : true
Number of parameters                    : 18
Number of discrete variables            : 0
Number of actions                       : 14
Total number of locations               : 27
Average locations per IPTA              : 5.4
Total number of transitions             : 39
Average transitions per IPTA            : 7.8
------------------------------------------------------------

BEGIN CONSTRAINT
 p2 >= 0
& p14 >= 0
& p0 >= 0
& p17 >= 0
& p2 + p17 >= 4
& p15 >= 0
& p14 + p15 >= 6
& p0 + p15 >= 12
& p16 >= 0
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
& p3 >= 0
& p1 >= 0
END CONSTRAINT

------------------------------------------------------------
Constraint soundness                    : possible under-approximation
Termination                             : terminated after reaching a target state (some states may have been unexplored)
Constraint nature                       : good
------------------------------------------------------------
Number of states                        : 29
Number of transitions                   : 38
Number of computed states               : 72
Total computation time                  : 0.058 second
States/second in state space            : 497.3 (29/0.058 second)
Computed states/second                  : 1234.7 (72/0.058 second)
Estimated memory                        : 3.520 MiB (i.e., 461392 words of size 8)
------------------------------------------------------------

------------------------------------------------------------
 Statistics: Algorithm counters
------------------------------------------------------------
main algorithm + parsing                : 0.064 second
main algorithm                          : 0.058 second
------------------------------------------------------------
 Statistics: Parsing counters
------------------------------------------------------------
model parsing and converting            : 0.006 second
------------------------------------------------------------
 Statistics: State computation counters
------------------------------------------------------------
number of state comparisons             : 23
number of constraints comparisons       : 23
number of new states <= old             : 17
number of new states >= old             : 0
StateSpace.merging attempts             : 6
StateSpace.merges                       : 3
------------------------------------------------------------
 Statistics: Graphics-related counters
------------------------------------------------------------
state space drawing                     : 0.000 second
------------------------------------------------------------
 Statistics: Global counter
------------------------------------------------------------
total                                   : 0.065 second
------------------------------------------------------------