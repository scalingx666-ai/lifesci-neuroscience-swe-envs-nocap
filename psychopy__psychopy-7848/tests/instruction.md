# Issue

**Title:** fix: `MovieStim` stalls at end of playback

## Description

Fix for `MovieStim` stalling when the movie ends. This PR is for the `release` branch, not applicable to `dev` which uses a completely new movie playback system.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `051482ac61d1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.