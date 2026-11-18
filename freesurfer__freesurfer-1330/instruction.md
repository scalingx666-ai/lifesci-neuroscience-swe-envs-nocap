# Issue

**Title:** Adding nifty_reg executables compiled on Ubuntu22

## Description

Recompiled the nifty_reg executable files on Ubuntu22, created a separate folder under nifty_reg to hold them, moved executable files to the annex, updated CMakeLists.txt to differentiate between Ubuntu versions for the installed exes

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4102e036fcc7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.