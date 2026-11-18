# Issue

**Title:** fix: incorrect time base for PTB used for Microphone

## Description

Fixes the "No data in recording buffer" issue when using PTB for microphones as reported [here](https://discourse.psychopy.org/t/no-audio-data-in-recording-buffer/48010).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6f24617e83a3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.