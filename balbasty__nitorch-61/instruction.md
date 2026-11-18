# Issue

**Title:** changes for the code to run

## Description

in math: added John's modifications to besseli (without it the estimation doesn't work),

in preproc: changed keys for noise estimation dict (unless they were meant the other way, but did not match)

in greeq: changed res and data for chi model to 0

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `48fabd298eb7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.