# Issue

**Title:** Remove doxygen from search results on readthedocs

## Description

From an internal discussion, the doxygen results are not very useful on RTD, and they overwhelmingly drown out any useful results from the search. On top of this, doxygen has its own built-in search anyway.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `73ff9a7d550c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.