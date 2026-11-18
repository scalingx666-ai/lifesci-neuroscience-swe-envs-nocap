# Issue

**Title:** Release 0.1.72

## Description

Silent release (no `## 0.1.72` section in RELEASE_NOTES.md).

Includes:
- #247 — Activity badge clears when read, the review banner shows once instead of on every launch/vault switch, and a Clear button in Activity

Merge with **Create a merge commit**, then fast-forward `staging` onto `main`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1193fbf46ca5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.