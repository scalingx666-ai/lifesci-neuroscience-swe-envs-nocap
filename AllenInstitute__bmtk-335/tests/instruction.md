# Issue

**Title:** Making non-separable FilterNet faster

## Description

I rewrote one function with numba, and it makes non-separable FilterNet much faster.
With no MPI, it is >10x faster (using numba's parallelization). With MPI (with an 8-core CPU), it is ~40x faster.

This change makes numba a requirement for FilterNet, so let's discuss it at the meeting before merging it.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8b0c5e55e645`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.