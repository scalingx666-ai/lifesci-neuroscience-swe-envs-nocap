# Issue

**Title:** CMake: add object libraries to the export set for static builds

## Description

For shared builds, the linker combines all object files and CMake discards the private properties of the `lslboost` and `lslobj` targets.
For shared libraries, it just combines the object files and adds references to the interface properties of the two object libraries, so they need to be imported.

Copying the properties manually is messy and error-prone, so this PR adds the two object libraries to the export this. Hopefully .

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e846ed195339`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.