# Issue

**Title:** Performance Improvements

## Description

Various performance improvements:

- Fixed GPU variables being redefined at each timestep in MSTDP learning rule to prevent unnecessary CPU->GPU overhead
- Added 'foldable' pipelines: Pipeline features are collapsed into as few matrix operations as possible during a compute step. Saves runtime, particularly for GPU implementations.
- Added sparse/event-based computation. Previously during a compute step for a common feature like `Weight`, an operation like `W @ v` would be executed for a feature-matrix `W` and pre-synaptic spike vector `v`. If activity in `v` is sparse, many of the multiplication operations would result in 0's, wasting computational time. The event-based computation removes columns adjacent to entries in `v` which are 0's to prevent this.
- Added test cases for the `MultiCompartmentConnection` and validity of all the above

Also added a new stress-test model at `examples/stress_test/example_network.py` and benchmark scripts at `examples/benchmark/sparse_computation and foldable pipeline`. The model contains 20,000 excitatory + 2,000 inhibitory neurons, and MSTDP learning rules with sparsely populated multicompartment connections. 

The model itself produces no meaningful behavior, but tests a general case of a large model with medium-activity and sparse connections. Benchmark scripts tell us the performance improvements that come with this model:

```
Foldable pipelines + sparse compute (combined)
  (%-time speedup of 'fold_sparse' vs baseline 'expansion')
========================================================================
  [CPU ] exc=  2000  time= 20  |  expansion=    8.14 ms   fold_sparse=    3.61 ms   |  speedup =  +55.6% time
  [CUDA] exc= 20000  time= 50  |  expansion=  107.58 ms   fold_sparse=   23.09 ms   |  speedup =  +78.5% time

```

(Times reported are median run times per- ```compute``` call)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e6f211e90cac`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.