# Issue

**Title:** Fix dataset hashing

## Description

# Description

The initial implementation of `NwbHasher` hashed datasets, but did not incorporate the result into the cumulative hash. This PR would close #1597 and #1598

# Checklist:

- [X] Yes, If this PR should be accompanied by a release, I have updated the `CITATION.cff`
- [X] N/a. If this PR edits table definitions, I have included an `alter` snippet for release notes.
- [X] N/a. If this PR makes changes to position, I ran the relevant tests locally.
- [ ] If this PR makes user-facing changes, I have added/edited docs/notebooks to reflect the changes
- [x] I have updated the `CHANGELOG.md` with PR number and description.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b6d59a025a96`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.