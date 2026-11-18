# Issue

**Title:** fix(intake): solid color blocks were causing errors

## Description

The DBF was solid inf and was wrecking havoc. We fix this
by using black_border=True when the min and max label match
and are non-zero. Solid zero blocks are caught earlier.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `48acc326b73b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.