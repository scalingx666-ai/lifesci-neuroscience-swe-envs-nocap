# Issue

**Title:** Apis 1081 explore desktop freezes when device is turned off during streaming

## Description

- Removed reconnection counter / trying to reconnect multiple times (based on Maziar's request)
- Added a step to check for services offered by the bleak client and exit if the EEG service is not listed anymore (not on Mac)
- Also added unpairing (not on Mac)

This isn't tested on Linux and should be regarded as a hotfix for the issue, turning off the device, reconnecting, disconnecting all seems to work "as expected" now on Mac and Windows.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `08ebb30a4c34`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.