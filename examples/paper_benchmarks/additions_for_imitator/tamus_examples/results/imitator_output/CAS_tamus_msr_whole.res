(************************************************************
 * Result by: IMITATOR 3.1-beta "Cheese Artichoke" (build master/e4be7d7)
 * Model    : 'tamus_examples/CAS/CAS_tamus_msr.imi'
 * Generated: Mon Aug 9, 2021 23:42:41
 * Command  : imitator tamus_examples/CAS/CAS_tamus_msr.imi tamus_examples/CAS/CAS_tamus.imiprop
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
Constraint soundness                    : exact
Termination                             : regular termination
Constraint nature                       : good
------------------------------------------------------------
Number of states                        : 167
Number of transitions                   : 240
Number of computed states               : 274
Total computation time                  : 0.094 second
States/second in state space            : 1774.7 (167/0.094 second)
Computed states/second                  : 2911.8 (274/0.094 second)
Estimated memory                        : 5.261 MiB (i.e., 689643 words of size 8)
------------------------------------------------------------

------------------------------------------------------------
 Statistics: Algorithm counters
------------------------------------------------------------
main algorithm + parsing                : 0.097 second
main algorithm                          : 0.094 second
------------------------------------------------------------
 Statistics: Parsing counters
------------------------------------------------------------
model parsing and converting            : 0.003 second
------------------------------------------------------------
 Statistics: State computation counters
------------------------------------------------------------
number of state comparisons             : 548
number of constraints comparisons       : 548
number of new states <= old             : 81
number of new states >= old             : 0
StateSpace.merging attempts             : 454
StateSpace.merges                       : 3
------------------------------------------------------------
 Statistics: Graphics-related counters
------------------------------------------------------------
state space drawing                     : 0.000 second
------------------------------------------------------------
 Statistics: Global counter
------------------------------------------------------------
total                                   : 0.097 second
------------------------------------------------------------