# Issue

**Title:** test(cam): add builder tests for camera

## Description

Adds a psyexp file to test viewing live camera streams within a builder routine. Uses `ImageStim` as a target to present frames. Requires a test environment with a real camera attached to the system to run

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7a115777bd84`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.