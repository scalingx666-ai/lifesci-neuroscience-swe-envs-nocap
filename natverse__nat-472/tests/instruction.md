# Issue

**Title:** Speeding up simplify_neuron

## Description

Apart from suggestions @jefferis listed in #471 I noticed (following profiling) that calling apply on columns is much longer than just running dijkstra from start node again, compare:

```r
> system.time(which.max(apply(dd, 2, robust_max)) )
   user  system elapsed 
  3.784   0.744   4.622 

> system.time(igraph::distances(ng, v=start, to=leaves, mode = 'out'))
   user  system elapsed 
  0.204   0.004   0.209 
```

This already reduces time by half:

```r
> system.time(simplify_neuron(large_neuron[[1]]))
   user  system elapsed 
  5.489   1.780   7.399 
> system.time(simplify_neuron(large_neuron[[1]]))
   user  system elapsed 
  2.730   0.834   3.565 
```

Said neuron below to compare:
[large_neuron.rds.zip](https://github.com/natverse/nat/files/6741054/large_neuron.rds.zip)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0fe1b29d942b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.