# Issue

**Title:** Optogenetics metadata

## Description

# Description

Table definitions and ingestion for optogenetic metadata.  Includes:
- Optogenetic protocols, (eg. pulse_length, period, triggers)
- Virus and injection sites
- Optical fiber and implant site

 
- find pose objects from flat list of nwb objects on import

# Related pull requests
- 
- 
- 

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

- [x] This PR should be accompanied by a release: No
- [x] If release, I have updated the `CITATION.cff`: NA
- [x] This PR makes edits to table definitions: No
- [x] If table edits, I have included an `alter` snippet for release notes. NA
- [x] If this PR makes changes to position, I ran the relevant tests locally. Y
- [x] I have updated the `CHANGELOG.md` with PR number and description.
- [x] I have added/edited docs/notebooks to reflect the changes: N

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6f8f68da41f0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.