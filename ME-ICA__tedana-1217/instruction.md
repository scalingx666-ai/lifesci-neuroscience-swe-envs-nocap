# Issue

**Title:** Download decision trees from figshare

## Description

.

Changes proposed:

- `download_json` function that downloads decision trees from figshare to `out_dir` if not in `DEFAULT_TREES` or saved locally.
- Some relevant tests

Please note that some users on protected networks may encounter SSL issues when connecting to figshare’s API.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `48916dd83c0d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.