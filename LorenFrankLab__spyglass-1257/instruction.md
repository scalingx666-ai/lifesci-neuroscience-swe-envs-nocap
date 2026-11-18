# Issue

**Title:** Add script for drive space check

## Description

# Description

This PR proposes adding a cronjob for checking the available space of each drive every morning and informing a list if people if we're above a threshold.

- Current drive space levels are ~40-70%
- I propose a 90% limit, and emailing the lab's gmail plus me if above

# Checklist:

- [x] N. This PR should be accompanied by a release: (yes/no/unsure)
- [x] N/a If release, I have updated the `CITATION.cff`
- [x] N. This PR makes edits to table definitions: (yes/no)
- [x] N/a If table edits, I have included an `alter` snippet for release notes.
- [x] N/a If this PR makes changes to position, I ran the relevant tests locally.
- [x] I have updated the `CHANGELOG.md` with PR number and description.
- [x] I have added/edited docs/notebooks to reflect the changes

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a31600cfe468`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.