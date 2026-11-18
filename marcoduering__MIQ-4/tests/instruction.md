# Issue

**Title:** Cold-path review fixes

## Description

- **Chore: config and doc update**
- **Treat gzip ISIZE trailer as a hint, not a bound**
- **Require the declared payload to be present in every parser guard**
- **Select the windowing percentiles instead of sorting**
- **Pin the fast slice decode to the voxel() reference**
- **Make the bounded reads cancelable and guard against a superseded model**

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0e4e5be7039a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.