# Issue

**Title:** Correctly parse subject sex when contained in dict

## Description

# Description

 
- `Subject._adjust_keys_for_entry` passes `Subject.standardize_sex_string` with a dictionary key
- `getattr` doesn't work as desired on that, so gets back the default of "U"
- Fix: check if passed value is a dict in ``Subject.standardize_sex_string` and pull out `sex` key if so

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

- [x] N If this PR should be accompanied by a release, I have updated the `CITATION.cff`
- [x] NA If this PR edits table definitions, I have included an `alter` snippet for release notes.
- [x] N If this PR makes changes to position, I ran the relevant tests locally.
- [x] NAIf this PR makes user-facing changes, I have added/edited docs/notebooks to reflect the changes
- [x] I have updated the `CHANGELOG.md` with PR number and description.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7d50c8111c3c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.