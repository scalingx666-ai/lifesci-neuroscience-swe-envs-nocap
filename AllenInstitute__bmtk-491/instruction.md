# Issue

**Title:** PointNet: cast nsyns to int before multiplying by syn_weight

## Description

PointNet fails to build inhibitory connections under numpy 2:

```
type_params[edge_id]['weight'] = nsyns * syn_weight
OverflowError: Python integer -550 out of bounds for uint32
```

The builder saves `nsyns` as `uint32` and `syn_weight` from the edge-types csv comes back as a Python int, and numpy 2 no longer promotes that product (NEP 50). Positive weights and float weights were unaffected, which is why the `ei_networks/pointnet` example still built its excitatory edges.

This casts `nsyns` to int before the multiplication on the batched path and in `point_syn_weight`, and adds a test that builds a small network with `syn_weight=-550` through `NetworkBuilder` and checks the NEST connection weights.

Tested with NEST 3.10 / numpy 2.4: the new test fails on `develop` with the OverflowError above and passes with the change; `tests/simulator/pointnet`, `tests/builder`, `tests/utils` otherwise unchanged (257 passed).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `60e5e62f3807`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.