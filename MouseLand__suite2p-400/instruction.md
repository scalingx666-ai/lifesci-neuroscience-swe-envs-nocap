# Issue

**Title:** DVC Pull doesn't require authentication anymore.

## Description

This PR fixes the authentication issue with DVC:
- Gdrive-user-json has been added so that `dvc pull` does not prompt user for verification code. 
- Google account associated with this `credentials.json` file just has view access to the gdrive so `dvc push` won't work
- Environment variables for gdrive on travis have been removed
- added back 1P commits

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `716ed9c33afb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.