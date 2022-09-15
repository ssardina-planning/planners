# FF and Metric-FF Planners

This repo contains the various versions of `FF` and `Metric-FF`. Its original site can be found [here](https://fai.cs.uni-saarland.de/hoffmann/ff.html)

To compile we need to install `flex` and `bison`. In Ubuntu:

```shell
$ sudo apt install flex bison
```

Planners have ben configured with a max number of operators of 5000. This can be changed by setting `MAX_OPERATORS` in the `ff.h` files.

The folder `bin/` contains compiled binary versions for Linux.

Finally, binaries have been renamed to `ff` and `mff` and with their corresponding variables, so that it is clear which planner we are running. Originally, all the binaries were called `ff`.

Performance results can be found [here](https://fai.cs.uni-saarland.de/hoffmann/2002.html).

## FF Versions

- `ff2.3`: this is the original FF v2.2 as used in the 2nd International Planning Competition, modulo removal of a few minor bugs in the pre-processing phase, plus handling of ADL enhanced goal orderings pruning technique and with the ordering information provided by the Goal Agenda (adapted from Jana Koehler's work).
- `ff2.3-suda`: Martin Suda has contributed a patched version of FF-v2.3 whose parser is supposed to be able to parse larger inputs.
- `ff2.3-goldman`: Robert Goldman patched version of FF-v2.3 in which the parser allows newlines within typed lists.

**Note:** The versions in this repo (source and binaries) have all had their limits increased as per the `suda` version. So, the version that has all the extensions would be `ff2.3-goldman`.

A run example:

```shell
❯ bin/ff2.3 -o pddl/ff/inventory/inventory-domain.pddl -f pddl/ff/inventory/inventory-p01-sokoban.pddl

ff: parsing domain file
domain 'INVENTORY-PATH' defined
 ... done.
ff: parsing problem file
problem 'INVENTORY-PATH1' defined
 ... done.



Cueing down from goal distance:   40 into depth [1]
                                  39            [1]
                                  38            [1]
                                  37            [1]
                                  36            [1]
                                  35            [1]
                                  34            [1]
                                  33            [1]
                                  32            [1]
                                  31            [1]
                                  30            [1]
                                  29            [1]
                                  28            [1]
                                  27            [1]
                                  26            [1]
                                  25            [1]
                                  24            [1]
                                  23            [1]
                                  22            [1]
                                  21            [1]
                                  20            [1]
                                  19            [1]
                                  18            [1]
                                  17            [1]
                                  16            [1]
                                  15            [1]
                                  14            [1]
                                  13            [1]
                                  12            [1]
                                  11            [1]
                                  10            [1]
                                   9            [1]
                                   8            [1]
                                   7            [1]
                                   6            [1]
                                   5            [1]
                                   4            [1]
                                   3            [1]
                                   2            [1]
                                   1            [1]
                                   0            

ff: found legal plan as follows

step    0: MOVE C1-1 C1-2 RIGHT
        1: MOVE C1-2 C2-3 DOWNRIGHT
        2: MOVE C2-3 C3-4 DOWNRIGHT
        3: MOVE C3-4 C4-5 DOWNRIGHT
        4: MOVE C4-5 C5-6 DOWNRIGHT
        5: MOVE C5-6 C6-7 DOWNRIGHT
        6: MOVE C6-7 C7-8 DOWNRIGHT
        7: MOVE C7-8 C8-9 DOWNRIGHT
        8: MOVE C8-9 C9-10 DOWNRIGHT
        9: MOVE C9-10 C8-11 UPRIGHT
       10: MOVE C8-11 C9-12 DOWNRIGHT
       11: MOVE C9-12 C10-13 DOWNRIGHT
       12: MOVE C10-13 C11-12 DOWNLEFT
       13: MOVE C11-12 C12-11 DOWNLEFT
       14: MOVE C12-11 C13-10 DOWNLEFT
       15: MOVE C13-10 C14-9 DOWNLEFT
       16: MOVE C14-9 C14-8 LEFT
       17: MOVE C14-8 C14-7 LEFT
       18: MOVE C14-7 C14-6 LEFT
       19: MOVE C14-6 C14-5 LEFT
       20: MOVE C14-5 C14-4 LEFT
       21: MOVE C14-4 C14-3 LEFT
       22: MOVE C14-3 C14-2 LEFT
       23: MOVE C14-2 C15-1 DOWNLEFT
       24: MOVE C15-1 C16-2 DOWNRIGHT
       25: MOVE C16-2 C16-3 RIGHT
       26: MOVE C16-3 C17-4 DOWNRIGHT
       27: MOVE C17-4 C18-5 DOWNRIGHT
       28: MOVE C18-5 C19-6 DOWNRIGHT
       29: MOVE C19-6 C18-7 UPRIGHT
       30: MOVE C18-7 C19-8 DOWNRIGHT
       31: MOVE C19-8 C18-9 UPRIGHT
       32: MOVE C18-9 C19-10 DOWNRIGHT
       33: MOVE C19-10 C18-11 UPRIGHT
       34: MOVE C18-11 C19-12 DOWNRIGHT
       35: MOVE C19-12 C18-13 UPRIGHT
       36: MOVE C18-13 C19-14 DOWNRIGHT
       37: MOVE C19-14 C18-15 UPRIGHT
       38: MOVE C18-15 C19-16 DOWNRIGHT
       39: MOVE C19-16 C19-17 RIGHT


time spent:    0.02 seconds instantiating 4108 easy, 0 hard action templates
               0.01 seconds reachability analysis, yielding 308 facts and 2054 actions
               0.00 seconds creating final representation with 308 relevant facts
               0.00 seconds building connectivity graph
               0.01 seconds searching, evaluating 41 states, to a max depth of 1
               0.04 seconds total time
```

## Metric-FF Versions

 A natural extension of FF's algorithms to a subset of PDDL 2.1 level 2, i.e. to numerical state variables; more precisely, Metric-FF's algorithms can handle effects and constraints on linear functions over numerical state variables (more details available on the Metric-FF homepage).

- `mff1.0`: Metric-FF as used in the competition.
- `mff2.0`: a version that treats additive cost minimization in a much better way, using A*-epsilon to combine the usual relaxed plan goal-distance estimation with relaxed plan remaining-cost estimation. As a gimmick, this version also handles a simple form of derived predicates where those predicates are not allowed to occur negated in preconditions/axiom conditions/goals.
- `mff2.1`: like 2.0 except it adds the possibility to specify an upper bound on plan cost. (If that is done, states are pruned based on g + hmax.)

An example run:

```shell
./bin/mff2.1 -o pddl/mff/depots-numeric-automatic/domain.pddl -f pddl/mff/depots-numeric-automatic/instances/instance-10.pddl


ff: parsing domain file
domain 'DEPOT' defined
 ... done.
ff: parsing problem file
problem 'DEPOTPROB7654' defined
 ... done.


warning: numeric precondition. turning cost-minimizing relaxed plans OFF.

ff: search configuration is Enforced Hill-Climbing, then A*epsilon with weight 5.
Metric is ((1.00*[TOTAL-TIME]) - () + 0.00)
COST MINIMIZATION DONE (WITHOUT cost-minimizing relaxed plans).

Cueing down from goal distance:   22 into depth [1]
                                  21            [1]
                                  20            [1]
                                  19            [1]
                                  18            [1][2][3]
                                  16            [1][2]
                                  14            [1][2][3]
                                  13            [1]
                                  12            [1]
                                  11            [1]
                                  10            [1][2]
                                   9            [1]
                                   8            [1]
                                   7            [1]
                                   6            [1][2][3][4]
                                   4            [1]
                                   3            [1]
                                   2            [1]
                                   1            [1]
                                   0            

ff: found legal plan as follows
step    0: LIFT HOIST1 CRATE0 PALLET1 DEPOT1
        1: LOAD HOIST1 CRATE0 TRUCK0 DEPOT1
        2: DRIVE TRUCK0 DEPOT1 DEPOT2
        3: UNLOAD HOIST2 CRATE0 TRUCK0 DEPOT2
        4: LIFT HOIST5 CRATE3 CRATE2 DISTRIBUTOR2
        5: DRIVE TRUCK0 DEPOT2 DISTRIBUTOR2
        6: LOAD HOIST5 CRATE3 TRUCK0 DISTRIBUTOR2
        7: LIFT HOIST5 CRATE2 PALLET5 DISTRIBUTOR2
        8: LOAD HOIST5 CRATE2 TRUCK0 DISTRIBUTOR2
        9: DRIVE TRUCK0 DISTRIBUTOR2 DISTRIBUTOR0
       10: LIFT HOIST3 CRATE5 PALLET3 DISTRIBUTOR0
       11: LOAD HOIST3 CRATE5 TRUCK0 DISTRIBUTOR0
       12: UNLOAD HOIST3 CRATE2 TRUCK0 DISTRIBUTOR0
       13: DRIVE TRUCK0 DISTRIBUTOR0 DEPOT0
       14: DROP HOIST3 CRATE2 PALLET3 DISTRIBUTOR0
       15: LIFT HOIST0 CRATE1 PALLET0 DEPOT0
       16: LOAD HOIST0 CRATE1 TRUCK0 DEPOT0
       17: UNLOAD HOIST0 CRATE3 TRUCK0 DEPOT0
       18: DRIVE TRUCK0 DEPOT0 DEPOT2
       19: DROP HOIST0 CRATE3 PALLET0 DEPOT0
       20: LOAD HOIST2 CRATE0 TRUCK1 DEPOT2
       21: LIFT HOIST2 CRATE4 PALLET2 DEPOT2
       22: LOAD HOIST2 CRATE4 TRUCK1 DEPOT2
       23: DRIVE TRUCK1 DEPOT2 DISTRIBUTOR2
       24: UNLOAD HOIST5 CRATE4 TRUCK1 DISTRIBUTOR2
       25: DROP HOIST5 CRATE4 PALLET5 DISTRIBUTOR2
       26: UNLOAD HOIST5 CRATE0 TRUCK1 DISTRIBUTOR2
       27: DROP HOIST5 CRATE0 CRATE4 DISTRIBUTOR2
plan cost: 28.000000

time spent:    0.00 seconds instantiating 6120 easy, 0 hard action templates
               0.00 seconds reachability analysis, yielding 198 facts and 900 actions
               0.00 seconds creating final representation with 186 relevant facts, 5 relevant fluents
               0.00 seconds computing LNF
               0.00 seconds building connectivity graph
               0.04 seconds searching, evaluating 249 states, to a max depth of 4
               0.04 seconds total time
```
