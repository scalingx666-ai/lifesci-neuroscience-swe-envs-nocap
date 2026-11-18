# Issue

**Title:** BF: Error when playing movies: AttributeError: 'MovieFileReader' object has no attribute '_cleanUpAudioTrack'

## Description

Fixes an attribute error that is raised when the movie is unloaded.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0515a2db7c3d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.