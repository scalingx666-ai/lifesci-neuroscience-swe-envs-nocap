# Issue

**Title:** BUG: Install full Python include/ tree, not just pyconfig.h

## Description

Bundle all Python header files (Python.h, cpython/, internal/, etc.) alongside the previously-installed pyconfig.h so that tools that JIT-compile C extensions against the bundled interpreter — such as torch.compile, Cython, pybind11, and numba — can find the headers they need without requiring a separately installed Python.

Fixes

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `189dd9c80c84`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.