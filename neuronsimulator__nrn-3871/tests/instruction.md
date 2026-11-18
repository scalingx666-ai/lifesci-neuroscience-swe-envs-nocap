# Issue

**Title:** Fix reference counting in vec_as_numpy_helper

## Description

Fixes a small leak, as po.release() gives up nanobind ownership without decreasing the ref counter.
It's a small leak, but `as_numpy` gets called at every step for every cell to calculate LFPs in NetPyNE.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `53de154d6130`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.