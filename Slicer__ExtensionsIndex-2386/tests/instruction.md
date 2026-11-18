# Issue

**Title:** Fix DRAISegmentation build configuration

## Description

Updates the existing DRAISegmentation extension entry to use the corrected build configuration and source revision.

- Removes the obsolete `build_subdirectory: inner-build` setting.
- Updates `scm_revision` to .
- The source update removes unintended superbuild settings and the duplicate `find_package(Slicer)` call that caused the extension build failure.

The corrected extension was packaged successfully locally for Slicer 5.12.3 on Windows x64.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0c0792c64e01`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.