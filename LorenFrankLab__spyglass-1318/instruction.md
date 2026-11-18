# Issue

**Title:** Import generalizations

## Description

# Description

 
- Populating `DIOEvents`
- If no raw timeseries in nwb file, make new interval list `'dio data valid times'`

 
- During import, can have existing `Task` entry that differs in secondary key (e.g. `task_description`)
- Instead of immediate error, prompt user whether to accept the differing value (defaults to false in test_mode)
- Also added to:
    - DataAcquisitionDevice 

 
- Reverts the changes in #1220 for `probe_id`
- `probe_id` imported from `probe_type` rather than `probe_description`

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2eb0ee173e84`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.