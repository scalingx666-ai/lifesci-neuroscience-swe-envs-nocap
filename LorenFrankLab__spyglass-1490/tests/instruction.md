# Issue

**Title:** Generalize naming for ingestion of data for `Raw`

## Description

# Description

**Issue**
- The `Raw` table ingests data from `pynwb.ecephys.ElectricalSeries` objects
- Since this can also include LFP data, further restricted to obj with the name `e-series` using the `SpyglassIngestion` property `_source_nwb_object_name = "e-series"`
- This is pretty restrictive for existing nwb data from other labs

**This PR**
- Allow the `_source_nwb_object_name` to be a list of possible `str` values
- identify nwb  objects with any matching name and type


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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ef27c90ac8b3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.