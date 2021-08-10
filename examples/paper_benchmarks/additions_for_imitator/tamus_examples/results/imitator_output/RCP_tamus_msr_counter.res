(************************************************************
 * Result by: IMITATOR 3.1-beta "Cheese Artichoke" (build master/e4be7d7)
 * Model    : 'tamus_examples/rcp/RCP_tamus_msr.imi'
 * Generated: Tue Aug 10, 2021 01:53:27
 * Command  : imitator tamus_examples/rcp/RCP_tamus_msr.imi tamus_examples/rcp/RCP_tamus_witness.imiprop
 ************************************************************)


------------------------------------------------------------
Number of IPTAs                         : 5
Number of clocks                        : 6
Has invariants?                         : true
Has clocks with rate <>1?               : false
L/U subclass                            : U-PTA
Has silent actions?                     : false
Is strongly deterministic?              : false
Number of parameters                    : 1
Number of discrete variables            : 0
Number of actions                       : 16
Total number of locations               : 48
Average locations per IPTA              : 9.6
Total number of transitions             : 98
Average transitions per IPTA            : 19.6
------------------------------------------------------------

BEGIN CONSTRAINT
 p0 >= 253
END CONSTRAINT

------------------------------------------------------------
Constraint soundness                    : possible under-approximation
Termination                             : terminated after reaching a target state (some states may have been unexplored)
Constraint nature                       : good
------------------------------------------------------------
Number of states                        : 46
Number of transitions                   : 63
Number of computed states               : 64
Total computation time                  : 0.019 second
States/second in state space            : 2401.9 (46/0.019 second)
Computed states/second                  : 3341.8 (64/0.019 second)
Estimated memory                        : 4.280 MiB (i.e., 561022 words of size 8)
------------------------------------------------------------

------------------------------------------------------------
 Statistics: Algorithm counters
------------------------------------------------------------
main algorithm + parsing                : 0.022 second
main algorithm                          : 0.019 second
------------------------------------------------------------
 Statistics: Parsing counters
------------------------------------------------------------
model parsing and converting            : 0.003 second
------------------------------------------------------------
 Statistics: State computation counters
------------------------------------------------------------
number of state comparisons             : 28
number of constraints comparisons       : 28
number of new states <= old             : 17
number of new states >= old             : 0
StateSpace.merging attempts             : 21
StateSpace.merges                       : 1
------------------------------------------------------------
 Statistics: Graphics-related counters
------------------------------------------------------------
state space drawing                     : 0.000 second
------------------------------------------------------------
 Statistics: Global counter
------------------------------------------------------------
total                                   : 0.022 second
------------------------------------------------------------