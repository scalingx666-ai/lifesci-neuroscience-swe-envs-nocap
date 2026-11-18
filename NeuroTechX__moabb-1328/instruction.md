# Issue

**Title:** Add dataset and device columns to the paradigm metadata (leave-one-device-out with groups="device")

## Description

Second of three steps from the review of #1305 (first: #1327, merged). Makes the grouping used for transfer evaluation explicit in the metadata, keeping **dataset** (provenance) and **device** (recording system) apart: one dataset can use several devices, and several datasets can share one.

**Problem.** `get_data`'s metadata carried only `subject`, `session` and `run`. Leave-one-dataset-out over a `CompoundDataset` needed a hand-written subject→dataset lookup, `CrossDatasetSplitter` (which groups by a `"dataset"` column) could not run on paradigm output, and there was no way to group by device at all: `METADATA.acquisition.hardware` is free text (107 distinct strings, e.g. seven spellings of the g.tec g.USBamp; 25 datasets give none).

**Change**
- `get_data` metadata gets two columns:
  - `dataset`: the dataset code; inside a `CompoundDataset`, the dataset the subject comes from (`BaseDataset._source_code`);
  - `device`: the recording device of the session (`BaseDataset._device(subject, session)`), by default `canonical_device(METADATA.acquisition.hardware)`.
- `moabb.datasets.metadata.devices.canonical_device`: a short ordered pattern table mapping the 107 strings to 30 devices. A manufacturer-only entry becomes `"<maker> (model not given)"` rather than being merged into a specific model; unmatched text is kept as is; no entry gives `"unknown"` (curation of the 25 missing entries is left to a separate PR).
- `CompoundDataset` delegates `_device` to the source dataset; `Peters2026` overrides it per visit (DSI-24 or DSI-Flex).
- The `groups` docs list the metadata columns.

Usage:
```python
CrossSubjectEvaluation(datasets=[compound], cv_class=LeaveOneGroupOut, groups="device")   # leave-one-device-out
CrossSubjectEvaluation(datasets=[compound], cv_class=LeaveOneGroupOut, groups="dataset")  # leave-one-dataset-out
```

**Behaviour change:** two more default metadata columns; one test pinning the column list is updated.

**Tests:** `canonical_device` on real hardware strings; `dataset`/`device` columns for plain and compound datasets, including a device change between sessions and a device shared by two datasets; leave-one-dataset-out and leave-one-device-out evaluations (a device spanning two datasets is held out as one group). `test_paradigms.py`, `test_evaluations.py`, `test_splits.py` and `test_metadata.py` pass locally.

Not changed: `cv_class=CrossDatasetSplitter` passed directly to `CrossSubjectEvaluation` is still refused (top-level splitters must hold out one subject per test fold); the `groups=` form covers it.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a7175ed49b98`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.