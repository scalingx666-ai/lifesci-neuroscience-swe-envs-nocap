# Issue

**Title:** Fixed some bugs in Kelly Kapowski

## Description

Kelly Kapowski did not pass args through.  Also, the use of `missing` is not correctly used.  For example, if `m` is not specified by the user, you get an error, and not the intended behavior - using the default value.  I removed these parts in the if statement.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f3d609361fd7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.