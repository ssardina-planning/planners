# FF and Metric-FF Planners

This repo contains the various versions of `FF` and `Metric-FF`. Its original site can be founder [here](https://fai.cs.uni-saarland.de/hoffmann/ff.html)

To compile we need to install `flex` and `bison`. In Ubuntu:

```
sudo apt install flex bison
```

Planners have ben configured with a max number of operators of 5000. This can be changed by setting `MAX_OPERATORS` in the `ff.h` files.

The folder `bin/` contains compiled binary versions for Linux.

Finally, binaries have been renamed to `ff` and `mff` and with their corresponding variables, so that it is clear which planner we are running. Originally, all the binaries were called `ff`. 
