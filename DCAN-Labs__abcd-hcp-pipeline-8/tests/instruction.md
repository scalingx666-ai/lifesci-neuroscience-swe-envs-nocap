# Issue

**Title:** hotfix for singularity containers

## Description

tested against singularity v3.1.0, this addresses #7
we will need to see how older installations of singularity handle this.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9268be18ef22`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.