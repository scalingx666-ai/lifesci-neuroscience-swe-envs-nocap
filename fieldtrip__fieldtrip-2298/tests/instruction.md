# Issue

**Title:** update dccnpath and added test script

## Description

This  and #2281 and includes the following improvements

- better documentation of what `dccnpath` does
- better handling of local copies of test data
- automatically download the public data
- various use cases of `dccnpath` are now tested in its own test script

The credits go to @contsili, I only made some cleanups to his work. See also

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3f2c1e3d502d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.