# Issue

**Title:** Replace depreacted since CMake 3.12 FindPythonInterp with FindPython3

## Description

Replace depreacted since CMake 3.12 `FindPythonInterp` with `FindPython3`, which emits author warnings from CMake 3.27 and will be removed from a future CMake release.

Also updates cmake_minimum_required to be consistent to ensure FindPython3 is avialable, excluding 3rd party deps

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8f4ef9b8ba9a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.