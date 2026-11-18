# Issue

**Title:** Update regex substitution calls to use count keyword

## Description

Fix a python deprecation in `re.sub()` causing warnings to be emitted from default builds in Ubuntu 25.04 and above.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9db0ee45ee90`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.