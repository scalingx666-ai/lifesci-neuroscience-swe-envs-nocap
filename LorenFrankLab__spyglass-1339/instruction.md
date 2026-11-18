# Issue

**Title:** DLC updates

## Description

# Description

Please include a summary of the changes and the related issue. Please also
include relevant motivation and context. Please list issues fixed or closed by
This PR.

- : updating info for how to use the notebooks, and fixing parts that were breaking
    - `/spyglass/notebooks/21_DLC.ipynb`: updated that the env used is `spyglass-dlc` which is installed from `environment_dlc.yml`; fixes the error in pose estimation section where `'model_key' is not defined` by creating an instance of `dlc_pose_estimation` before creating variable `pose_estimation_key`
    - `/spyglass/notebooks/22_DLC_Loop.ipynb`: same as above
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

- [ ] This PR should be accompanied by a release: NO
- [ ] If release, I have updated the `CITATION.cff`
- [ ] This PR makes edits to table definitions: NO
- [ ] If table edits, I have included an `alter` snippet for release notes.
- [ ] If this PR makes changes to position, I ran the relevant tests locally.
- [ ] I have updated the `CHANGELOG.md` with PR number and description.
- [x] I have added/edited docs/notebooks to reflect the changes

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fa9d97a897dc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.