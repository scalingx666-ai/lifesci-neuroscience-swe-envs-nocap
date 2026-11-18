# Issue

**Title:** Mock device behaviour when impedance mode is enabled

## Description

- Adds generation of calibration info packet (with fake data) to the server
- Adapts mock server behaviour when generating command info packets when the command received was 'enable impedance mode' (PID 167)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f29c2ad0871d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.