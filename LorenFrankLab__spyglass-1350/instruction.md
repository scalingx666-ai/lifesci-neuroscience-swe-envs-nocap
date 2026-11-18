# Issue

**Title:** Report table name in `accept_divergence`

## Description

# Description

A user had questions what table was causing these new input prompts, so I elected to add another parameter to the function to report the table name within the prompt itself

# Checklist:

- [X] No. This PR should be accompanied by a release: (yes/no/unsure)
- [X] n/a. If release, I have updated the `CITATION.cff`
- [X] no. This PR makes edits to table definitions: (yes/no)
- [X] n/a. If table edits, I have included an `alter` snippet for release notes.
- [X] n/a. If this PR makes changes to position, I ran the relevant tests locally.
- [x] I have updated the `CHANGELOG.md` with PR number and description.
- [X] n/a. I have added/edited docs/notebooks to reflect the changes

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9a5ef792faa0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.