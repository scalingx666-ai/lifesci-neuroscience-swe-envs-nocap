# Issue

**Title:** Disable target install when liblsl is not the top-level project.

## Description

Replaces #238 

Here we take a different approach. When liblsl is the top-level project, LSL_INSTALL is enabled by default, but if it's included via `add_subdirectory` or `FetchContent` then the liblsl targets are not installed.

@jcelerier please let me know what you think

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d1fab801a6a7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.