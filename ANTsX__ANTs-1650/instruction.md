# Issue

**Title:** COMP: Fix some compile errors when legacy functionality is removed

## Description

Legacy removal is forced to ON [when wrapping is enabled](https://github.com/InsightSoftwareConsortium/ITK/blob/c8ec91c826898838f5f1a1a2a53849dd3efc9c88/CMakeLists.txt#L305-L310). Prepare ANTs for building in such a scenario. We will need it soon in https://github.com/thewtex/ANTsWasm.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e1239db92021`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.