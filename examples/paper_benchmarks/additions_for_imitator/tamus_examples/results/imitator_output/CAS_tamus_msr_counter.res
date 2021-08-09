(************************************************************
 * Result by: IMITATOR 3.1-beta "Cheese Artichoke" (build master/e4be7d7)
 * Model    : 'tamus_examples/CAS/CAS_tamus_msr.imi'
 * Generated: Tue Jun 8, 2021 00:27:43
 * Command  : imitator tamus_examples/CAS/CAS_tamus_msr.imi tamus_examples/CAS/CAS_tamus_witness.imiprop
 ************************************************************)


------------------------------------------------------------
Number of IPTAs                         : 5
Number of clocks                        : 5
Has invariants?                         : true
Has clocks with rate <>1?               : false
L/U subclass                            : U-PTA
Has silent actions?                     : true
Is strongly deterministic?              : true
Number of parameters                    : 2
Number of discrete variables            : 0
Number of actions                       : 14
Total number of locations               : 27
Average locations per IPTA              : 5.4
Total number of transitions             : 39
Average transitions per IPTA            : 7.8
------------------------------------------------------------

BEGIN CONSTRAINT
 p1 >= 4
& p0 >= 12
END CONSTRAINT

------------------------------------------------------------
Constraint soundness                    : possible under-approximation
Termination                             : terminated after reaching a target state (some states may have been unexplored)
Constraint nature                       : good
------------------------------------------------------------
Number of states                        : 29
Number of transitions                   : 38
Number of computed states               : 72
Total computation time                  : 0.012 second
States/second in state space            : 2271.4 (29/0.012 second)
Computed states/second                  : 5639.5 (72/0.012 second)
Estimated memory                        : 3.150 MiB (i.e., 412997 words of size 8)
------------------------------------------------------------

------------------------------------------------------------
 Statistics: Algorithm counters
------------------------------------------------------------
main algorithm + parsing                : 0.014 second
main algorithm                          : 0.012 second
------------------------------------------------------------
 Statistics: Parsing counters
------------------------------------------------------------
model parsing and converting            : 0.002 second
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
total                                   : 0.015 second
------------------------------------------------------------