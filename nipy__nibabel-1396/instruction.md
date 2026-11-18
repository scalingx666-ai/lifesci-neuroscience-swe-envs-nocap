# Issue

**Title:** ENH: Add mode parameter to nibabel.processing.conform()

## Description

Currently the conform function always uses `constant` mode. This PR adds the `mode` parameter to the conform function. The default value remains `constant`, preserving backward compatibility.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9d1c0e5aefaa`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.