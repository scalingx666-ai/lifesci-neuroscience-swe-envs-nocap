# Issue

**Title:** Short circuit parallel computation

## Description

Parallel computation short circuits if a cut is found with Phi=0.
This introduces a random aspect into the partitioned constellation returned, adjusted test package accordingly
Also now prune out inputs and outputs for main complex computation

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3228dfb666bc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.