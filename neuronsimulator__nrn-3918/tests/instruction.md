# Issue

**Title:** MPI bug fix for rxd MCR on the ECS which don't generate a current.

## Description

Each rank wrote it's changes at a rank-local offset instead of its global displacement into that buffer, so only rank 0 changes were in right place. The extracellular half of every reaction on ranks>0 were discarded while the intracellular half still applied.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fec1f072b763`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.