# Issue

**Title:** fix: get devicemanager microphone backend correctly in camera

## Description

Fixes looking up microphone devices during camera initialization, including some changes to the machinery within `DeviceManager` itself

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4738f5013902`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.