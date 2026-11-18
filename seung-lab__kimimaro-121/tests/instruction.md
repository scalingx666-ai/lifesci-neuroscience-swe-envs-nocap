# Issue

**Title:** fix: roll_invalidation_cube anisotropic weights bug

## Description

Two correctness fixes for roll_invalidation_cube, plus regression tests.
1. Cython axis ordering (skeletontricks.pyx). The wrapper linearized path coordinates and unpacked anisotropy in Fortran order while passing C-contiguous numpy arrays to the C++. Outputs were rotated 90° on cubic+anisotropic inputs and scrambled on asymmetric volumes. Fix: tell the C++ that the fast (stride-1) axis is labels.shape[2] rather than labels.shape[0], and permute the path linearization and anisotropy unpacking to match. Public API unchanged.
2. Thin x-bbox cancellation (skeletontricks.hpp). When radius / wx was small enough that a path voxel's x-bbox collapsed to width 1 (minx == maxx), pass 1's topology trick wrote +1 and -1 to the same cell. They cancelled, and pass 2's coloring > 0 || topology[idx] != 0 check skipped those cells, dropping the path voxel's entire contribution. Fix: when minx == maxx, zero the bbox cells directly in pass 1 and skip the topology entries.

Tests in automated_tests.py: cubic-isotropic baseline, asymmetric volume hand-listed expectation, anisotropic axis-ordering check, single-path thin-bbox reproducer, and a 100-fixture random sweep against an independent geometric reference.

Please let me know if any questions.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `66f488e8ff06`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.