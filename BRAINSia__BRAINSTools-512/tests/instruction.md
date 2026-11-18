# Issue

**Title:** ENH: Combined the logic of identical `if/else` and `switch` statements into one.

## Description

There are code locations where the value of a `switch` or logic for an `if/else` is different, but the contents are the same.
These have now been combined so the body is only written once.
This reduces redundant code but may negatively affect readability.
This implements the bugprone-branch-clone clang-tidy check.
	-”Repeated branch in conditional chain"

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d7ca97b78bcf`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.