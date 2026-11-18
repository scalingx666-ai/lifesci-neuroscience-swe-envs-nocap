# Issue

**Title:** Table chains cascade shortest path #1353

## Description

# Description

In #1353, we saw an issue with the delete permission check finding a connection between `Session` and `DLCProject`. It ...

1. unexpectedly traversed `IntervalList` despite it being on the 'no visit' list
2. attempted to follow a unidirectional path 'up' the graph, rather than the prescribed shortest path found

This PR...
1. removes the banned tables before the path search
2. allows the graph traversal to follow a multi-directional path

# Checklist:

- [X] No. This PR should be accompanied by a release: (yes/no/unsure)
- [X] N/a. If release, I have updated the `CITATION.cff`
- [X] No. This PR makes edits to table definitions: (yes/no)
- [X] No. If table edits, I have included an `alter` snippet for release notes.
- [X] N/a. If this PR makes changes to position, I ran the relevant tests locally.
- [X] I have updated the `CHANGELOG.md` with PR number and description.
- [X] N/a. I have added/edited docs/notebooks to reflect the changes

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `881877bf794e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.