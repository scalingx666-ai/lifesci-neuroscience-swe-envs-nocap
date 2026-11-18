# Issue

**Title:** Add metadata for motion parameters

## Description

.

## Changes proposed in this pull request

- Add metadata, including Units, for motion parameters (6 basic parameters and FD).
    - I included FD because it might be good to log the head radius that is used to calculate it at some point (e.g., if  moves forward)

## Documentation that should be reviewed

none

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d9f0a8e52b80`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.