# Issue

**Title:** ENH: Add dedicated session filtering, alternative anatomical template options

## Description

Builds off 

Adds new arguments:
- `--session-label` for a more streamlined way to filter sessions
- `--subject-anatomical-reference` to determine how the reference anatomical should be constructed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7fbfb0a80ee1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.