# Issue

**Title:** Added possibility to compare trees for equality

## Description

Trees being lists, this patch adds an `__eq__` to terminals and primitives. For terminals, we compare the value and return type, while for primitives the name, the arguments and the return type.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b8804a826583`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.