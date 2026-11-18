# Issue

**Title:** Fix recompute `update_id`

## Description

# Description

This PR ...
- changes the alter script to ensure all fk dependencies are imported before running alter
- changes `update_id` process to run on null entries rather than empty strings

The process of updating has been slow - gonna turn it into a process pool

# Checklist:

- [X] No. This PR should be accompanied by a release: (yes/no/unsure)
- [X] N/a. If release, I have updated the `CITATION.cff`
- [X] No. This PR makes edits to table definitions: (yes/no)
- [X] N/a. If table edits, I have included an `alter` snippet for release notes.
- [X] N/a. If this PR makes changes to position, I ran the relevant tests locally.
- [X] I have updated the `CHANGELOG.md` with PR number and description.
- [X] N/a. I have added/edited docs/notebooks to reflect the changes

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6bba1f78218a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.