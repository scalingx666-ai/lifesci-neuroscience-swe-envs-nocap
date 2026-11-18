# Issue

**Title:** ENH: test notebooks

## Description

tests the guide notebooks in continuous integration, though it does not run any model training (to avoid jobs crashing).

also advances tensorflow dependency from 2.0.0rc0 to 2.0.0 and tests on python 3.7.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a4f1cebb1d4d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.