# Issue

**Title:** Use Boost.Endian for endian conversions

## Description

lslboost includes Boost.Endian (and several optimizations for newer compilers / architectures) so we don't need the included subset in `src/` any more.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f74014f47fe0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.