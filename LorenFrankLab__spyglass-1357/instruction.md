# Issue

**Title:** Allow return of Interval obj from `to_indices` method

## Description

# Description

#1354 highlighted a but introduced in #1293 that expected an `IntervalList` object to be returned from the `to_indices` method. This PR...
- introduces an optional flag to this method that allows for further computation on the returned indices
- cleans up the dictionary declaration for insert

# Checklist:

- [X] No. This PR should be accompanied by a release: (yes/no/unsure)
- [X] N/a. If release, I have updated the `CITATION.cff`
- [X] No. This PR makes edits to table definitions: (yes/no)
- [X] N/a. If table edits, I have included an `alter` snippet for release notes.
- [X] No. If this PR makes changes to position, I ran the relevant tests locally.
- [X] I have updated the `CHANGELOG.md` with PR number and description.
- [X] N/a. I have added/edited docs/notebooks to reflect the changes

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `476a64851cf0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.