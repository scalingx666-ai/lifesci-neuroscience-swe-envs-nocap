# Issue

**Title:** Decoding qol updates

## Description

# Description


- Allows `DecodingParameters` `fetch` and `fetch1` to accept heading arguments

Implements `full_key_decorator`
- Utility function that can be used to decorate class methods of datajoint table classes
- Designed to allow user to call functions such as `fetch_spike_data(key)` without `key` containing all primary key elements as long as `key` specifies a unique database entry

Change previously `staticmethods` to `classmethods` in clusterless pipleline
- tables
    - `SortedSpikesDecodingV1`
    - `ClusterlessDecodingV1`
    - `SortedSpikesGroup`
- lets us add the `full_key_decorator to these functions
- implemented to ensure that still works when called with full key and no existing entry (e.g. during calls in the `make` function

 
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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f56aba0de288`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.