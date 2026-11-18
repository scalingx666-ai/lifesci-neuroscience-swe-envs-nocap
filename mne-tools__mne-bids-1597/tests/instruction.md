# Issue

**Title:** FIX: write *_electrodes.json with SpatialReference for derivative datasets

## Description

.

Derivative datasets with a `space` entity fail the BIDS validator because the required `*_electrodes.json` (with `SpatialReference`) isn't written. This adds it and infers the value from the coordinate frame: template name for standard templates, a `bids::` URI to the subject T1w for `ACPC`/`ScanRAS`/`Pixels`, and `"n/a"` for head-based frames.

## Reproducer

```python
from mne_bids import write_raw_bids, BIDSPath, make_dataset_description

bp = BIDSPath(subject="01", task="test", root="/tmp/x", datatype="eeg")
write_raw_bids(raw, bp, overwrite=True)
make_dataset_description(path="/tmp/x", name="x", dataset_type="derivative", overwrite=True)
```

| | `deno -A jsr:@bids/validator /tmp/x` |
|--|--|
| `main` | `[ERROR] SIDECAR_KEY_REQUIRED: SpatialReference` |
| this PR | 0 errors |

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9f1e63537b02`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.