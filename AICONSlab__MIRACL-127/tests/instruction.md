# Issue

**Title:** [feat] MIRACL version incremented and improvements to build/installation script

## Description

# Summary

- MIRACL version incremented from `2.2.6` to `2.3.0`
- Renamed `build.sh` to `install.sh`
- Added flag (default: `true`) to disable mounting of MIRACL scripts dir for dev purposes
- Default shm size for Docker is now set to `int(MemTotal/1024)*0.85`
- Minor improvements to `install.sh` code

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `567dde3b6b98`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.