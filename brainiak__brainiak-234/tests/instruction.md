# Issue

**Title:** dev: Use venv instead of virtualenv

## Description

This is a revert of PR #218. The bug that prevented us from using venv
has been fixed:
https://bugzilla.redhat.com/show_bug.cgi?id=1263057

The commit is not an actual Git revert because I also added python3-venv
to the requirements in the README.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2adf216785c4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.