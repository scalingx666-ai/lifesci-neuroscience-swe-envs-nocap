# Issue

**Title:** Generalizations for nwb ingestion

## Description

# Description

Resolution of several issues regarding nwb ingestion by other groups.

-  
  - When finding videos for population of `VideoFile` get all `ImageSeries` objects in the nwb file rather than looking specifically in `nwbf.processing['video']`
  - Less arbitrarily restrictive for other labs' nwb generation  

-  
    - Allow complete ingestion of task tables with more than one row
 
-  
    - Modify definition of `ImportedLFP`
        - No longer dependent on `AnalysisNwbfile`
        - Instead, expected to point to an e-series object containing lfp data in the raw nwb  
    - Implement `ImportedLFP._no_transaction_make`
        - Find  LFP objects in the raw file and the eseries contained within. For each object
            - Determine the electrodes of the eseries, making a new `LFPElectrodeGroup` entry if necessary
            - Make a `IntervalList` entry spanning the lfp times
            - insert into `ImportedLFP` 

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

- [x] Unsure This PR should be accompanied by a release: (yes/no/unsure)
- [x] N If release, I have updated the `CITATION.cff`
- [x] YES This PR makes edits to table definitions: (yes/no)
- [x] Y If table edits, I have included an `alter` snippet for release notes.
- [x] NA If this PR makes changes to position, I ran the relevant tests locally.
- [x] I have updated the `CHANGELOG.md` with PR number and description.
- [x] I have added/edited docs/notebooks to reflect the changes

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fdb1d56fea6f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.