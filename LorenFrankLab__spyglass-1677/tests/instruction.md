# Issue

**Title:** Dandi updates

## Description

**DANDI Export & Validation Improvements:**

- Added explicit skipping of existing files and validation during DANDI uploads by setting `existing=UploadExisting.SKIP` and `validation=UploadValidation.SKIP` in `compile_dandiset` for more efficient uploads. [[1]](diffhunk://#diff-100f0ccce3f018b6826cf32f4cb44602e2d8e8d72414869dcb89dffcbd0d2772R7) [[2]](diffhunk://#diff-100f0ccce3f018b6826cf32f4cb44602e2d8e8d72414869dcb89dffcbd0d2772R363-R364)

**Error Handling & Logging:**

- Came across issue in `prepare_files_for_export`. If error occured in one file during multiprocessing, the interrupt could trigger new invalid file states in the other files interrupted during editing. 
    - Solution: wrap each file edit with a try/except.  Log errors without interrupting other processes 

**DANDI Validation Results Table Refactor:**

- fix the validation part tables inserts to work correctly for each part table

**Dandi standards for weight**

* Dandi requires a space between the number and unit.  Now catches cases such as `500g` and corrects to `500 g`

**Other**
- 
    - Remove unimplemented overide `Wavforms.fetch_nwb` in favor of the mixin method 

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b79116928944`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.