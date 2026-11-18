# Issue

**Title:** Release v0.1.55

## Description

Promotes `staging` to production and bumps the four version files 0.1.54 → 0.1.55.

Ships:
- #118 — switching to an on-device synced vault opens the folder and paints the tree before any network call or reconcile; sync catches up in the background (was 1–5 s and grew with vault size).
- #117 — a revoked note is removed from the device outright instead of trashed, and the banner says access was removed.

Both verified on the staging app. Merge with "Create a merge commit", then fast-forward `staging` onto `main`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5747c3b7615f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.