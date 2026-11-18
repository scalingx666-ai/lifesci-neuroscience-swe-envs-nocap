# Issue

**Title:** perf: increase postprocess speed

## Description

kimimaro.skeletontricks.find_cycle is a bottleneck in post-processing. Let's see if we can find a way to make it a bit faster. Since we are attempting to do sharded format generation on a single machine, making the post-processing step faster can reduce the size of the machine required.  

- find_cycle rewritten in C++ and returns path instead of edge list
- create_distance_graph rewritten in C++ 
- Remove double bookkeeping using `nx.Graph` in remove_loops
- Remove some uses of consolidate
- Take _remove_ticks from quadratic to quasi-linear by online-updating `terminal_nodes`

There's still a small improvement that can be made via `remove_row` but will require some investigation.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `60c2e82feba0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.