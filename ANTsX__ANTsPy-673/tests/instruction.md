# Issue

**Title:** COMP: Docker build suddenly stopped working, needs classic solver

## Description

Something under the hood is causing the mamba solver to fail, reproduced on my Ubuntu machine as well as on the GHA runner. Using the classic solver appears to fix it

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c4f0e324b747`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.