(************************************************************
 * Result output by IMITATOR
 * Version  : IMITATOR 2.12.1 "Butter Lobster" (build 3061)
 * Git      : master/4e8b1c8
 * Model    : 'benchmarks/example/CAS2_tamus_msr.imi'
 * Generated: Wed Sep 16, 2020 18:58:06
 * Command  : ./bin/imitator benchmarks/example/CAS2_tamus_msr.imi -mode EFunsafe -incl -output-result -time-limit 1200 -counterexample
 ************************************************************)


------------------------------------------------------------
Number of IPTAs                         : 5
Number of clocks                        : 5
Has stopwatches?                        : false
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
Number of states                        : 37
Number of transitions                   : 49
Number of computed states               : 50
Total computation time                  : 0.011 second
States/second in state space            : 3304.4 (37/0.011 second)
Computed states/second                  : 4465.4 (50/0.011 second)
Estimated memory                        : 3.118 MiB (i.e., 408720 words of size 8)
------------------------------------------------------------

------------------------------------------------------------
 Statistics: Algorithm counters
------------------------------------------------------------
main algorithm + parsing                : 0.014 second
main algorithm                          : 0.011 second
------------------------------------------------------------
 Statistics: Parsing counters
------------------------------------------------------------
model parsing and converting            : 0.003 second
------------------------------------------------------------
 Statistics: State computation counters
------------------------------------------------------------
number of state comparisons             : 37
number of constraints comparisons       : 26
number of new states <= old             : 13
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
total                                   : 0.014 second
------------------------------------------------------------