# Issue

**Title:** trying to create the overloaded operators

## Description

This needs to be checked (takes a long time on my machine).  Overall, though, I'm trying to overload the operators so you don't have to do things like `%%.antsImage` definitions in your code, but use the Ops methods already available (and Math).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `451d2ea7971d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.