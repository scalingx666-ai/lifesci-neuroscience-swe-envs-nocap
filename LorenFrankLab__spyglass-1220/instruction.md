# Issue

**Title:** Miscellaneous Fixes

## Description

# Description

-  
    - Update documentation link 
-  
    - In `Probe.insert_from_nwbfiile()` define `probe_id` from `probe_description` rather than `probe_type`
    - Allows for non 1:1 relationship between `ProbeType` and `Probe`
    - Update `ElectrodeGroup.insert_from_nwbfile()` to account for the change
    - Update tests for changes
- #396 (Partial Fix):
     - allows for `Raw.insert_from_nwbfile()` to work when non-ElectricalSeries objects are in nwb.acquisition
     - Raises Warning if multiple electrical series objects present and inserts one of them
     - No change to functionality to current nwbs in franklab
     - Does not resolve adding multiple electircal series in a session
     
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

- [x] N This PR should be accompanied by a release: (yes/no/unsure)
- [x] NA If release, I have updated the `CITATION.cff`
- [x] N This PR makes edits to table definitions: (yes/no)
- [x] NA If table edits, I have included an `alter` snippet for release notes.
- [x] NA If this PR makes changes to position, I ran the relevant tests locally.
- [x] I have updated the `CHANGELOG.md` with PR number and description.
- [x] NA I have added/edited docs/notebooks to reflect the changes

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dbae127f79c2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.