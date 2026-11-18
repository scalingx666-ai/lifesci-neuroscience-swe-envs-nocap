# Issue

**Title:** Avoid skip_duplicates to prevent database locks

## Description

# Description


- transaction grouping in `populate_all_common` leads to long transaction times
- tables like `Lab` often have pre-existing entries in database
- Previously used `skip_duplicates=True` to avoid error
    - Led to long-held locks prevventing simultaneous session insertion by multiple users
- This instead checks validity of duplicate and skips attempting to insert entirely if present
    - Should help avoid conflicting locks between users  

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3cf217d50fb0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.