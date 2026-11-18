# Issue

**Title:** Fix/sample condition

## Description

MRG: Fix/sample condition.

This one is based on Michael's work to handle cleanly the case where the onset=0 is used.

The main difference now is that we removed all constraints on the frametimes or the condition onset.

We have introduced a min_onset variable, defaulting at -20s, to start sampling possible response.

I have taken this opportunity to improve slightly the test syntax.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3ae259fc072c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.