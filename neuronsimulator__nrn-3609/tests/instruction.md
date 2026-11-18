# Issue

**Title:** Fix issue with wheel renaming for release

## Description

Seems to work: https://github.com/neuronsimulator/nrn/actions/runs/18009824735

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c8138a876390`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.