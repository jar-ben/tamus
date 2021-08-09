(************************************************************
 * Result by: IMITATOR 3.1-beta "Cheese Artichoke" (build master/e4be7d7)
 * Model    : 'tamus_examples/wfas/WFAS_tamus_msr.imi'
 * Generated: Tue Jun 8, 2021 02:08:20
 * Command  : imitator tamus_examples/wfas/WFAS_tamus_msr.imi tamus_examples/wfas/WFAS_tamus.imiprop
 ************************************************************)


------------------------------------------------------------
Number of IPTAs                         : 3
Number of clocks                        : 4
Has invariants?                         : true
Has clocks with rate <>1?               : false
L/U subclass                            : U-PTA
Has silent actions?                     : true
Is strongly deterministic?              : false
Number of parameters                    : 1
Number of discrete variables            : 0
Number of actions                       : 10
Total number of locations               : 10
Average locations per IPTA              : 3.3
Total number of transitions             : 23
Average transitions per IPTA            : 7.6
------------------------------------------------------------

BEGIN CONSTRAINT
 p0 > 5
END CONSTRAINT

------------------------------------------------------------
Constraint soundness                    : exact
Termination                             : regular termination
Constraint nature                       : good
------------------------------------------------------------
Number of states                        : 18
Number of transitions                   : 19
Number of computed states               : 20
Total computation time                  : 0.012 second
States/second in state space            : 1412.5 (18/0.012 second)
Computed states/second                  : 1569.4 (20/0.012 second)
Estimated memory                        : 2.587 MiB (i.e., 339095 words of size 8)
------------------------------------------------------------

------------------------------------------------------------
 Statistics: Algorithm counters
------------------------------------------------------------
main algorithm + parsing                : 0.016 second
main algorithm                          : 0.012 second
------------------------------------------------------------
 Statistics: Parsing counters
------------------------------------------------------------
model parsing and converting            : 0.003 second
------------------------------------------------------------
 Statistics: State computation counters
------------------------------------------------------------
number of state comparisons             : 16
number of constraints comparisons       : 16
number of new states <= old             : 2
number of new states >= old             : 0
StateSpace.merging attempts             : 11
StateSpace.merges                       : 0
------------------------------------------------------------
 Statistics: Graphics-related counters
------------------------------------------------------------
state space drawing                     : 0.000 second
------------------------------------------------------------
 Statistics: Global counter
------------------------------------------------------------
total                                   : 0.016 second
------------------------------------------------------------
