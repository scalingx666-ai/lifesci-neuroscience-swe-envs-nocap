# Issue

**Title:** FF: Various fixes to microphone recording

## Description

Fixes starting a microphone recording when running from studio. Adds missing attributes to the sounddevice microphone class for real-time listeners

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a94cbc23dc25`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.