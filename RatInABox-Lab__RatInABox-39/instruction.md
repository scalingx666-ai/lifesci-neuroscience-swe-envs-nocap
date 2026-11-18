# Issue

**Title:** Added params checking for all classes

## Description

Added params checking for all classes, addressing issue #38.
If an unrecognized parameter is passed to a class (i.e., occurs in none of the class' and its parents' default parameters), a warning is produced.

Also made minor modifications to the syntax for generating the figure paths, and enabled a multidirectory figure path to be provided.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3ac79391268e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.