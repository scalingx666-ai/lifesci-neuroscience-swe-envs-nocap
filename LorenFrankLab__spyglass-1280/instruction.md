# Issue

**Title:** LFP improvements

## Description

# Description

  - Adding a condition in the MAD detector to replace zero, NaN, or infinite MAD values with 1.0. 
  - Refactoring the creation of LFPElectrodeGroup with added input validation and transactional insertion.
  - Updating the LFPBandSelection logic with comprehensive validation and batch insertion for electrodes and references. 
  - Remove ability to decimate LFP data in `LFPBandSelection` using `set_lfp_band_electrodes`

# Checklist:

<!--
For items below with choices, select one (e.g., yes, no) 
and check the box to indicate that a choice was selected.
If not applicable, check the box and add `N/A` after the box.
For example:
- [X] This has a choice: no
- [X] N/A. If choice, other item.
This comment may be deleted on submission.

Alter notes example:
```python
from spyglass.example import Table
Table.alter() # Comment regarding the change
```
-->

- [x] This PR should be accompanied by a release: (yes/no/unsure)
- [x] If release, I have updated the `CITATION.cff`
- [x] This PR makes edits to table definitions: (yes/no)
- [x] If table edits, I have included an `alter` snippet for release notes.
- [x] If this PR makes changes to position, I ran the relevant tests locally.
- [x] I have updated the `CHANGELOG.md` with PR number and description.
- [x] I have added/edited docs/notebooks to reflect the changes

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `43c4ac285b9b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.