# Issue

**Title:** Make sure parent directory exists in decoding

## Description

# Description

Fixes 

This pull request ensures that the results directory is created if it doesn't already exist before saving output files in both the clusterless and sorted spikes decoding modules. This change improves reliability by preventing errors when writing results to non-existent directories.

Directory creation improvements:

* In `src/spyglass/decoding/v1/clusterless.py`, the `make` method now creates the results directory using `Path(config["SPYGLASS_ANALYSIS_DIR"]) / nwb_file_name` before generating and saving results files.
* In `src/spyglass/decoding/v1/sorted_spikes.py`, the `make` method similarly ensures the results directory exists before saving results.



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

- [x] This PR should be accompanied by a release: (yes/**no**/unsure)
- [x] If release, I have updated the `CITATION.cff`
- [x] This PR makes edits to table definitions: (yes/**no**)
- [x] If table edits, I have included an `alter` snippet for release notes.
- [x] If this PR makes changes to position, I ran the relevant tests locally.
- [x] I have updated the `CHANGELOG.md` with PR number and description.
- [x] I have added/edited docs/notebooks to reflect the changes

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1446caad98c4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.