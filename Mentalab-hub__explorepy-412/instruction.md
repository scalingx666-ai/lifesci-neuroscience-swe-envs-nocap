# Issue

**Title:** Fixes incorrect board ID for 8 ch BLE, changes settings logic to check against FW version

## Description

- Replaces board ID for 8 channel BLE devices with the correct string (PCB_303_801E_XX)
- Changes the settings manager logic such that channel count retrieval is dependent on FW major version
- Adds dicts to match FW major version and PCB ID to channel counts / refactoring

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c8208c25a26f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.