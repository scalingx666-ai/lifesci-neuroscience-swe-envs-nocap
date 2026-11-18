# Issue

**Title:** FIX: more generous events.tsv reading

## Description

, .

Two small fixes in `events_file_to_annotation_kwargs`:

1. Drop rows with invalid onset markers (`n/a`, `nan`, `NaN`, `""`) before float conversion. Previously `nan`/`NaN` leaked through as `float("nan")` and `""` raised `ValueError`.
2. When `trial_type` is entirely `n/a` but `value` has trigger codes, fall back to `value` instead of dropping every row.

## Reproducer (end-to-end `read_raw_bids`)

```python
import openneuro
from mne_bids import BIDSPath, read_raw_bids

openneuro.download(
    dataset="ds004843",
    target_dir="/tmp/ds004843",
    include=["sub-001/eeg/sub-001_task-VisualSituationalAwareness_run-2_*",
             "dataset_description.json", "participants.tsv"],
)
bp = BIDSPath(subject="001", task="VisualSituationalAwareness", run="2",
              datatype="eeg", suffix="eeg", extension=".set",
              root="/tmp/ds004843")
raw = read_raw_bids(bp)
print(len(raw.annotations), "annotations")
```

| | result |
|--|--|
| `main` | `ValueError: cannot convert float NaN to integer` (in `mne/annotations.py:crop`) |
| this PR | 4048 annotations, all onsets finite |

Other affected datasets: `ds004841`, `ds004842`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1d33aa0bdbed`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.