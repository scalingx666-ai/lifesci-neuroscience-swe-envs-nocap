# Issue

**Title:** Improvements to logs and errors

## Description

This PR fixes two minor but somewhat annoying issues:

- the "unused object" warning can now be switched off via a preference, and it will not be shown after an error; the preference is used to switch off the warning in the test suite
- The `DynamicArray.__dealloc__` method in the Cython implementation referred to the numpy module, which could lead to spurious errors during the interpreter teardown (with the module potentially not being available anymore)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b0016012f2cf`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.