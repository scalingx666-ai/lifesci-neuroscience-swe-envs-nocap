# Issue

**Title:** optimize stimulus.plot

## Description

@fladd  when plotting a stimulus, that had no surface yet, the temp-surface was created four time. That can be optimized.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `15962bf200f6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.