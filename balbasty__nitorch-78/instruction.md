# Issue

**Title:** Use nitorch built-in lmdiv over torch solve

## Description

* Replaced use of .solve with .lmdiv in various modules
* Did the same in demo notebooks

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `21502ecce8ad`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.