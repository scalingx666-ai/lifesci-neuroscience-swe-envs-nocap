# Issue

**Title:** checks for float 32

## Description

this might help fix #106 

here I just introduced checks for float32 in check_inputs and in the hrf stuff. 

I can't seem to think where else float 64 could emerge, but let's catch it if it does.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b7969683c725`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.