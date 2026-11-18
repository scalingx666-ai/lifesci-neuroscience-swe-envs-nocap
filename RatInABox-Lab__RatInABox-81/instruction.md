# Issue

**Title:** Fix union to work with python versions <3.10

## Description

Python 3.10 allows you to use the | operator as a shorthand for Union but is not backward compatible. This PR changes the syntax back to use Union from the typing module. 

Also adapts the setup file to include all python versions >3.7, which addresses

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6ef335a8468c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.