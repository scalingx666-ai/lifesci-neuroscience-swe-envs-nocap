# Issue

**Title:** Change BLOB fields to LONGBLOB in DecodingParameters

## Description

Updated the 'decoding_params' and 'decoding_kwargs' fields from BLOB to LONGBLOB in the DecodingParameters table definition to support larger data storage for model initialization parameters and keyword arguments.

# Description

User reported not being able to set `environment_labels` because `DataError: (1406, "Data too long for column 'decoding_kwargs' at row 1")`

This should allow the user to set those.

This will require an alter of the table.
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

- [x] If this PR should be accompanied by a release, I have updated the `CITATION.cff`
- [x] If this PR edits table definitions, I have included an `alter` snippet for release notes.
- [x] If this PR makes changes to position, I ran the relevant tests locally.
- [x] If this PR makes user-facing changes, I have added/edited docs/notebooks to reflect the changes
- [x] I have updated the `CHANGELOG.md` with PR number and description.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `85b141595c8d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.