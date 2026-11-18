# Issue

**Title:** Add permissions to GitHub Actions workflows

## Description

Explicitly set required permissions in test-conda.yml and test-package-build.yml workflows to improve security and clarify access needs.

# Description

Please include a summary of the changes and the related issue. Please also
include relevant motivation and context. Please list issues fixed or closed by
This PR.

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

- [x] This PR should be accompanied by a release: no
- [x] If release, I have updated the `CITATION.cff`
- [x] This PR makes edits to table definitions: no
- [x] If table edits, I have included an `alter` snippet for release notes.
- [x] If this PR makes changes to position, I ran the relevant tests locally.
- [ ] I have updated the `CHANGELOG.md` with PR number and description.
- [x] I have added/edited docs/notebooks to reflect the changes

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1f4934a3ec23`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.