# Issue

**Title:** Turn off all lights on init

## Description

Turning off all light by sending \x60 (binary: 01100000). This is tested with the original PST sr box and the VU boxes (USB buttons).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a13a49a9fe9b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.