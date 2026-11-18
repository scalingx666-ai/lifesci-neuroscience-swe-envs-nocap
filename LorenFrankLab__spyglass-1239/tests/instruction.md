# Issue

**Title:** Export external tables

## Description

# Description

This PR comprises a series of edits to make the following script appropriately tee-up the new moseq notebook:

<details><summary>Script</summary>

```python
from spyglass.common.common_usage import *
from spyglass.position.position_merge import *

paper_key = {"paper_id": "cbroz_moseq_test"}
pose_key = {
    "nwb_file_name": "SC100020230912_.nwb",
    "epoch": 9,
    "video_file_num": 14,
    "project_name": "sideHomeOfficial",
    "dlc_model_name": "sideHomeOfficial_tutorial_00",
    "dlc_model_params_name": "default",
    "task_mode": "trigger",
}

merge_key = (PositionOutput.DLCPosV1 & pose_key).fetch1("KEY")
ExportSelection().start_export(**paper_key, analysis_id=1)
(PositionOutput & merge_key).fetch_pose_dataframe()
ExportSelection().stop_export()
```

</details>

# Checklist:

- [X] No. This PR should be accompanied by a release: (yes/no/unsure)
- [X] N/a. If release, I have updated the `CITATION.cff`
- [X] No. This PR makes edits to table definitions: (yes/no)
- [X] N/a. If table edits, I have included an `alter` snippet for release notes.
- [x] If this PR makes changes to position, I ran the relevant tests locally.
- [x] I have updated the `CHANGELOG.md` with PR number and description.
- [X] N/a. I have added/edited docs/notebooks to reflect the changes

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2e8c78a1ad19`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.