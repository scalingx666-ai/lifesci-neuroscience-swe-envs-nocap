# Issue

**Title:** `get_labels` bugs, interactive fix

## Description

# Description

This PR adds an interactive fix for #1513 for each user. It sets up permission errors for restricting edits to owners following the cautious delete model. It allows users to decide to repopulate or edit existing labels, and tracks progress via a temporary table.

# Checklist:

- [X] N/a. If this PR should be accompanied by a release, I have updated the `CITATION.cff`
- [X] N/a. If this PR edits table definitions, I have included an `alter` snippet for release notes.
- [X] N/a. If this PR makes changes to position, I ran the relevant tests locally.
- [x] If this PR makes user-facing changes, I have added/edited docs/notebooks to reflect the changes
- [x] I have updated the `CHANGELOG.md` with PR number and description.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `97b1fef5f17b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.