# Issue

**Title:** FIX - Garbage collection exclude modelling modules and track size

## Description

Implements fixes mentioned here 

I also thought if would be nice to see the the size of files deleted. So I added that, too. It calculates total bytes, and then convers it to GB.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8d51195391e7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.