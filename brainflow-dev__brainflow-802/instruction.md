# Issue

**Title:** Fix MLModule post-build copy path for MSVC generators

## Description

Fixes an inconsistency in `src/ml/build.cmake` where MSVC POST_BUILD steps assume a config subdirectory (`compiled/$<CONFIG>/...`) while output is set to `compiled/`.

Replaces hardcoded source paths with target-based generator expressions:
- `$<TARGET_FILE:${ML_MODULE_NAME}>`
- `$<TARGET_LINKER_FILE:${ML_MODULE_NAME}>`

This improves compatibility with single-config generators (e.g. Ninja in CLion) where artifacts may not be placed in config-specific subdirectories.

Related to #255 and #604.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ee7d056ebd40`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.