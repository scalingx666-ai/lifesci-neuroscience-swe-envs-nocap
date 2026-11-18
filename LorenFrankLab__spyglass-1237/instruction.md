# Issue

**Title:** Resolve different code and database state for merge table parts

## Description

# Description

- As usage expands, more likely to have new pipelines coming into merge tables
- If a new merge part table is not in a second user's codebase, will cause errors for the second user ()
- Would be good to have strategy that enables custom project specific tables merge into shared merge tables without causing similar errors

This PR
- add a check that the code module has the table class attribute before adding to the `source_class_dict` to prevent errors
- Note, this means that a user without the code for a custom merge table part will not be able to fetch data from it.

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `48127270afa4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.