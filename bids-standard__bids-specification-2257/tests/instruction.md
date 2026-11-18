# Issue

**Title:** Staging BEP16 into an upstream branch

## Description

This PR will stage work done so far on BEP16 into a branch on the upstream repo (i.e., bids-standard/bids-specification, rather than arokem/bids-specification) so that maintainers can do work on the branch (this was specifically requested by @tsalo).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `373da35afb81`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.