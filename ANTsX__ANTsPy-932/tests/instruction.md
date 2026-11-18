# Issue

**Title:** ENH: More enhancements for displacement fields and other transforms

## Description

Following on from #930, trying to make the different transform types behave more consistently and give clearer errors for unsupported operations.

- Reject vector-only transformation of nonlinear transforms in C++. Previously, we passed this down to ITK, and DisplacementFieldTransforms gave a binding error.

- Add native bindings for getting and setting fixed parameters on 2D and 3D displacement-field transforms.

- Give informative error for the parameters and setter / getter on DisplacementFieldTransforms.

- Replace smoke tests with correctness assertions for mappings, image resampling, inversion, composition order, and serialization.

- Verify displacement-field fixed-parameter layout, updated geometry, and ITK’s reallocation of a zero displacement field.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `61a8f2aba45a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.