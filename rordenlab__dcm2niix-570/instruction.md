# Issue

**Title:** Changes for divest 0.10.2

## Description

Very minor changes against the current development branch for `divest` 0.10.2.

I want to make bigger changes to avoiding duplicating logic from the BIDS writer, but that's a bigger job and I'm still trying to work out how best to do it, so it can wait for now.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `56640080e780`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.