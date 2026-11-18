# Issue

**Title:** Fix Fastsrm issue #446

## Description

Solves #446 

I also added a perturbation when computing the basis so that DetSRM and FastSRM without an atlas matches exactly when low_ram mode is disabled.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f609cabea37e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.