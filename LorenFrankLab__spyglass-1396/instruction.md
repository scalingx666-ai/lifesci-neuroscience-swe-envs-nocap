# Issue

**Title:** Quickfix: Remove optogenetic epochs from analysis files

## Description

# Description

-  
    - Pop off optogenetic epochs in created analysis nwb files
    - Missing referenced dio data (removed in the analysis file) was creating the problem

- Partial for #1329 
   - Solves immediate error
   - Can pop up again in data with different/unique extensions
   - Should still make a more robust fix by only adding a select set of objects to the new analysis file (rather than popping off unwanted  

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7d39224c184f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.