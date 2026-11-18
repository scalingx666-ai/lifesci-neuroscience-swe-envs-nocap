# Issue

**Title:** Docker improve

## Description

1. I increased Ubuntu version to 16.04 since its default python3 version is 3.5 instead of 3.4, which causes deprecated wanrnings and the error when installing pygments.
2. I also rearranged the dockerfile, reduced the number of steps, tried to put the installation of dependencies before the build step of nighres.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c49e5d43046f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.