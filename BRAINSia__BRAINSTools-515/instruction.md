# Issue

**Title:** ENH: Surrounded macro replacement arguments with parenthesis.

## Description

It is recommended to surround macro arguments in the replacement list with parenthesis.
This ensures that the argument value is calculated properly.
This implements the bugprone-macro-parentheses clang-tidy check.
	-”Macro argument should be enclosed in parentheses"

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9637a823726a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.