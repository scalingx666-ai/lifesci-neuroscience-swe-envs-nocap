# Issue

**Title:** Predict disk space runway

## Description

# Description

This PR...
1. Refactors `check_disk_space.sh` to add CSV output for all drives
2. Adds `predict_runway.py` that predicts data runway based on recent data

# Checklist:

- [X] N/a. If this PR should be accompanied by a release, I have updated the `CITATION.cff`
- [X] N/a. If this PR edits table definitions, I have included an `alter` snippet for release notes.
- [X] N/a. If this PR makes changes to position, I ran the relevant tests locally.
- [x] If this PR makes user-facing changes, I have added/edited docs/notebooks to reflect the changes
- [x] I have updated the `CHANGELOG.md` with PR number and description.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `16817a398cc3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.