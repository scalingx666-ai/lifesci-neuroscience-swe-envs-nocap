# Issue

**Title:** Small fixes

## Description

Two small fixes:
- More robust test for version tuple vs. version string that does not fail for development versions that end with `.postXXX`
- Raise an `AttributeError` instead of a `KeyError`, when accessing non-existing attributes of the preferences object. This prevents errors when using `hasattr` for non-existing attributes which is most likely behind the error seen on Google Collab when the Debugger is active, see https://brian.discourse.group/t/error-in-google-colab/1401

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `88a2f6a416cd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.