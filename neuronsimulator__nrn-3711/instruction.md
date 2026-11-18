# Issue

**Title:** Fixes for nrnivmodl-cmake (try 3)

## Description

Set environment variables for the NMODL transpiler to find:
* the path to libpython.so/.dll
* the path to the NMODL python module

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `12281c273d6b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.