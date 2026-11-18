# Issue

**Title:** Fix typo: HD5_USE_FILE_LOCKING → HDF5_USE_FILE_LOCKING

## Description

## Summary

- Fixes typo in `SpyglassConfig.env_defaults` at `src/spyglass/settings.py:120` — the HDF5 library reads `HDF5_USE_FILE_LOCKING` (with the "F"), so the current key has had no effect since it was introduced in #722 (Dec 20 2023).
- DLC notebooks (`21_DLC.ipynb`, `22_DLC_Loop.ipynb`) already document the env var with the correct name, confirming the intent.

.

## Test plan

- [ ] Verify `os.environ["HDF5_USE_FILE_LOCKING"] == "FALSE"` after importing Spyglass on a fresh environment.
- [ ] Confirm users on networked/read-only filesystems no longer hit HDF5 file-lock errors that this default was meant to suppress.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `01e173fa95a4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.