# Issue

**Title:** Fix bug with lite backend closing

## Description

Make sure we close things properly for the `jupyterlite` backend by keeping (weak) refs to the close functions and actually running them. See failure in  .

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8df1a2049440`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.