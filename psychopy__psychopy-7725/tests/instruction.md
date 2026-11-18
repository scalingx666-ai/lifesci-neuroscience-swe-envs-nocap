# Issue

**Title:** BF: Allow audio streaming from disk for movies

## Description

Fixes audio data being loaded entirely into memory when playing a movie using a speaker device. This also adds a delay in the metadata extraction routine to prevent spamming commands to FFMPEG, and providing a better error message when it fails. Furthermore, it ensures that the player is closed before opening another movie on the same object

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0207da4953f5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.