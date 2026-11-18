# Issue

**Title:** Disable codecov patch check

## Description

# Description

Prevent failing test via patch coverage diff

# Checklist:

- [x] N/a. If this PR should be accompanied by a release, I have updated the `CITATION.cff`
- [x] N/a. If this PR edits table definitions, I have included an `alter` snippet for release notes.
- [x] N/a. If this PR makes changes to position, I ran the relevant tests locally.
- [x] N/a. If this PR makes user-facing changes, I have added/edited docs/notebooks to reflect the changes
- [x] I have updated the `CHANGELOG.md` with PR number and description.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bfa19c37e421`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.