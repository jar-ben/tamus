(************************************************************
 * Result output by IMITATOR
 * Version  : IMITATOR 2.12.1 "Butter Lobster" (build 3061)
 * Git      : master/4e8b1c8
 * Model    : 'benchmarks/RCP/RCP_tamus_msr.imi'
 * Generated: Tue Sep 15, 2020 16:56:43
 * Command  : ./bin/imitator benchmarks/RCP/RCP_tamus_msr.imi -mode EFunsafe -incl -output-result -time-limit 1200
 ************************************************************)


------------------------------------------------------------
Number of IPTAs                         : 5
Number of clocks                        : 6
Has stopwatches?                        : false
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
Constraint soundness                    : exact
Termination                             : regular termination
Constraint nature                       : good
------------------------------------------------------------
Number of states                        : 49
Number of transitions                   : 67
Number of computed states               : 68
Total computation time                  : 0.024 second
States/second in state space            : 2008.1 (49/0.024 second)
Computed states/second                  : 2786.7 (68/0.024 second)
Estimated memory                        : 4.523 MiB (i.e., 592850 words of size 8)
------------------------------------------------------------

------------------------------------------------------------
 Statistics: Algorithm counters
------------------------------------------------------------
main algorithm + parsing                : 0.029 second
main algorithm                          : 0.024 second
------------------------------------------------------------
 Statistics: Parsing counters
------------------------------------------------------------
model parsing and converting            : 0.004 second
------------------------------------------------------------
 Statistics: State computation counters
------------------------------------------------------------
number of state comparisons             : 53
number of constraints comparisons       : 33
number of new states <= old             : 19
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
total                                   : 0.029 second
------------------------------------------------------------