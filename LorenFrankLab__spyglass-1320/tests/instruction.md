# Issue

**Title:** Returned merge_id consistency for Merge.fetch_nwb

## Description

# Description

 
- In `Merge.fetch_nwb( return_merge_ids=True)` ensure that the merge ids are returned in the order corresponding with the nwb files
- Relevant for correct function of `SortedSpikeGroups.fetch_spike_data(key, return_unit_ids=True)`

Other:
- add `return_unit_ids` option to methods of `SortedSpikesGroup`
    - `get_spike_indicator`
    - `get_firing_rate`
     
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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9b125bb17273`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.