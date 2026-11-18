# Issue

**Title:** Efficient v0 recording load

## Description

# Description


- This pull request makes a targeted update to the `get_recording` method in `spikesorting_curation.py`. The method now uses the `load_recording` function instead of `_get_filtered_recording` to retrieve the recording associated with a curation. This change likely improves clarity or correctness in how recordings are loaded for downstream processing.

- Refactored `get_recording` in `spikesorting_curation.py` to use `SpikeSortingRecording.load_recording` instead of the internal `_get_filtered_recording` method, which may improve maintainability or ensure the correct version of the recording is loaded.

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

- [x] NA If this PR should be accompanied by a release, I have updated the `CITATION.cff`
- [x] NA If this PR edits table definitions, I have included an `alter` snippet for release notes.
- [x] NA If this PR makes changes to position, I ran the relevant tests locally.
- [x] NA If this PR makes user-facing changes, I have added/edited docs/notebooks to reflect the changes
- [x] I have updated the `CHANGELOG.md` with PR number and description.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5c75df6a56c8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.