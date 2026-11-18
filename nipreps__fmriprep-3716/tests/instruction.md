# Issue

**Title:** chore: Drop Python 3.12

## Description

This PR drops Python 3.12, bumps the Python pin on everything but the minimum tests up to Python 3.14, and updates `fmriprep-docker` to use a version-agnostic patching strategy (bind to `/patches/{package}` and set `PYTHONPATH="/patches"`).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `404c4a791dd2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.