# Issue

**Title:** chore(ci): Add pre-release workflow

## Description

#3671 dropped pre-release tests from branch/PR builds. This restores them as a weekly cron job that generates an issue on failure.

It also runs on any branch called ci/prerelease.

Based on work by @Remi-Gau and me in nipy/nibabel#1466.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `18f39175aeb5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.