# Issue

**Title:** FIX: Tolerate missing git

## Description

Closes gh-1285.

The alternative would be to catch the exception in the test, but I can't think of a good reason for us to crash the interpreter over this.

Any objections?

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f7b9bc4c89f9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.