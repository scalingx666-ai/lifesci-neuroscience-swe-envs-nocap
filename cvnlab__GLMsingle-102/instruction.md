# Issue

**Title:** fix calcbadness using special case for zero divisions.

## Description

I noticed a bug when some datasets lead to zero divides in calcbadness. 

- [x] ported special case of zero divide.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `797e4539eb22`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.