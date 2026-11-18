# Issue

**Title:** Label geom test

## Description

Fixing #783 

Add some tests for correct column names, and check return types. Labels should be ints.

Add same test to the function itself, and clean up extra numpy import statements.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `af2db53db17d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.