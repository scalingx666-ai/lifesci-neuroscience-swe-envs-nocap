# Issue

**Title:** Maintenance: automatically compile MEX files after c code change

## Description

This pull request contains a new github actions workflow file that automatically compiles MEX files after a c code change

The MEX files can be downloaded from the actions tab under `Compile MEX` as zip file
The action can be also manually triggered for a specific branch

The documentation for the new workflow under

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c0337a719a98`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.