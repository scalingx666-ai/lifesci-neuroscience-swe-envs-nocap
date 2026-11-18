# Issue

**Title:** COMP: Empty CMAKE_RUNTIME_OUTPUT_DIRECTORY

## Description

I can compile on my machine with ITK 6 but not with ITK 5.

Fixed by not passing down empty definitions of these variables

CMAKE_RUNTIME_OUTPUT_DIRECTORY
CMAKE_LIBRARY_OUTPUT_DIRECTORY
CMAKE_ARCHIVE_OUTPUT_DIRECTORY
CMAKE_BUNDLE_OUTPUT_DIRECTORY

This did not used to be a problem - it might be CMake or ITK version dependent.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2a25b6b032b0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.