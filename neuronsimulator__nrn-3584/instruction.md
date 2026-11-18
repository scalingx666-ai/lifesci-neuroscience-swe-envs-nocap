# Issue

**Title:** fix: `cell-permute` setting from python

## Description

Python `nrncore_arg` was overriding `cell-permute` from file even if the value was not given. In fact, if the value is already set CLI11 does not apply the value (as it should be).

Solution: check that the value was set (and not taken from default) before, eventually, setting it

Fix: #3583 

## Question: 

do you want a test for this? Where can I put it? Maybe add it to an existing one?

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f2b0ff25df49`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.