# Issue

**Title:** Only insert intervals from the epochs table

## Description

# Description

Issue:
- Currently entries in any TimeIntervals table is inserted into `IntervalList` during `IntervalList.insert_from_nwb_file`
- This scoops up entries from things like `FranklabOptogeneticEpochs` and names them uniformative things like `interval 1`
- This then leads to errors when trying to identifying matching epochs during ingestion of `TaskEpochs` table

Fix:
Restricts ingestion to only entries from the time intervals table named `epochs` in the nwb file

# Checklist:

<!--
For items below with `if`, please mark those that do not apply with N/A

For example:
- [X] N/A. If this PR X, related item.
- [X] If this PR Y, other item.
- [X] I have updated the `CHANGELOG.md` ...

Alter notes example:
```python
from spyglass.example import Table
Table.alter() # Comment regarding the change
```
-->

- [x] NA If this PR should be accompanied by a release, I have updated the `CITATION.cff`
- [x] NA If this PR edits table definitions, I have included an `alter` snippet for release notes.
- [x] NA If this PR makes changes to position, I ran the relevant tests locally.
- [x] NA If this PR makes user-facing changes, I have added/edited docs/notebooks to reflect the changes
- [x] I have updated the `CHANGELOG.md` with PR number and description.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `32b695069292`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.