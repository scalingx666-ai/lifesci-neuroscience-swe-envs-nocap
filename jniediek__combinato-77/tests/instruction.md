# Issue

**Title:** Use rng seed

## Description

Old code did not actually use the rng seed in the clustering binary because of a difference in integer sizes. This fixes that and uses the rng seed by shifting the bits.

Sorry about the older commits, which I believe are already in master. I don't know how to eliminate this.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6973ca113300`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.