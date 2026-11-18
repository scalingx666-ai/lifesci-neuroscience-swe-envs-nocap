# Issue

**Title:** Add more informative error to missing curation label for `FigURLCurationSelection`

## Description

# Description

This PR adds a more detailed error if a user attempts to create a URI without labels. Given the narrow scope of this error, I elected not to attempt to attempt to generate a URI without labels, and instead invite the user to reopen the issue if this feature is needed.

# Checklist:

- [X] N/a. If this PR should be accompanied by a release, I have updated the `CITATION.cff`
- [X] N/a. If this PR edits table definitions, I have included an `alter` snippet for release notes.
- [X] N/a. If this PR makes changes to position, I ran the relevant tests locally.
- [X] N/a. If this PR makes user-facing changes, I have added/edited docs/notebooks to reflect the changes
- [X] I have updated the `CHANGELOG.md` with PR number and description.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `50be44655d66`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.