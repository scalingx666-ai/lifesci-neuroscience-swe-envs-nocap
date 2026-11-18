# Issue

**Title:** Adding back support for matlabmcr

## Description

BTW, I've been working on adding support for [compiling FreeSurfer from source](https://github.com/pwighton/neurodocker/tree/20210825-refactor)

But things are super fragile right now, so I've held off on submitting a PR.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e9ff4f8a09cc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.