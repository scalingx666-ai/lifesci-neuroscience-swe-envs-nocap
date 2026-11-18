# Issue

**Title:** feat(datasets): generate summary table rows from METADATA and BIDS events/sidecars

## Description

## Summary
- Add `summary_row_from_metadata`, `summary_row_from_bids`, `build_summary_row`, and `generate_summary_table` in `moabb/datasets/base.py` (plus `get_summary_table(..., from_metadata=True, bids_roots=...)` and `docs/prepare_summary_tables.py --from-metadata`).
- Automatically synthesize `_summary_table` and the `Dataset summary` docstring admonition in `MetaclassDataset` when a dataset class defines `METADATA` without requiring a manual entry in `summary_*.csv`.
- Automatically populate `LocalBIDSDataset._summary_table` from BIDS `*_events.tsv`, `*_channels.tsv`, `*_eeg.json`, and `participants.tsv` so `dataset_bubble_plot` and `_get_dataset_parameters` work out of the box on local BIDS datasets.
- Support `cognitive` and `imagined_speech` paradigms in `moabb/analysis/_utils.py:_compute_n_trials`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a1d48fbb8104`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.