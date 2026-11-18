# Issue

**Title:** ENH: Allow static libs, re-enable testing

## Description

Run the short tests during the Docker build, add an option to turn off shared libs

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2d4c931913f4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.