# Issue

**Title:** Dreyer2023: serve EEG and subject-info from NEMAR sourcedata, fall back to OSF

## Description

## What

`Dreyer2023`/`Dreyer2023A`/`Dreyer2023B`/`Dreyer2023C` now load their EEG from NEMAR's `nm000250` `sourcedata/` store when the download provider policy allows it, following the same `upstream`/`auto`/`nemar` contract as other NEMAR-mirrored datasets (see `BaseDataset._sourcedata_store`/`_prefetch_nemar_sourcedata`):

- `upstream`: unchanged, always goes to OSF.
- `nemar`: fatal if the subject isn't in the local store (never silently falls back to OSF).
- `auto` (default): uses the store when the subject is already mirrored there, otherwise falls back to OSF with a warning -- exactly what was already happening for other datasets, but Dreyer2023's `data_path()`/`download_by_subject()` previously bypassed that machinery entirely and always hit OSF, including from the docs/example gallery build. That is what has been causing `examples/advanced_examples/plot_dreyer_clf_scores_vs_subj_info.py` to fail CI with OSF 429s (`files.de-1.osf.io`).

NEMAR's `sourcedata/` for this deposit ships bare EDFs (no `dataset_description.json` or sidecars), so a store hit is read directly with `mne.io.read_raw_edf` instead of `read_raw_bids`/`BIDSPath`; the EDFs carry the 769/770 annotation codes natively, so the existing rename-to-`left_hand`/`right_hand` step is unchanged and the result is byte-identical to the OSF path (verified on real data, see below).

`get_subject_info()` now reads `performance.csv` from the NEMAR store when it is present there (added to the deposit in a companion NEMAR update), else falls back to the OSF copy, under the same provider policy.

## Tests

Added focused offline tests in `moabb/tests/test_download.py` (synthetic store/EDF, no network): store hit returns the subject's EDFs directly; `upstream` still reaches OSF even with a store hit; `nemar` raises instead of falling back when the subject isn't cached; `_get_single_subject_data` reads a store EDF directly and preserves 769/770 -> left_hand/right_hand semantics; `get_subject_info()` reads the store's `performance.csv` when present, falls back to OSF when absent (warning) for `auto`, and raises for `nemar`.

## Real-data verification (Voyager, not in this diff)

For subjects `[1, 5, 7, 35]` (the ones used by the example), loaded `Dreyer2023A` via the NEMAR store (`provider="nemar"`) and via OSF (`provider="upstream"`) and compared channel names, sampling rate, `n_times`, annotation descriptions and raw sample data for all 4 subjects x 6 runs: all 24 comparisons matched exactly (`max_abs_diff == 0.0`). Also ran the example's exact `WithinSessionEvaluation` + CSP+LDA pipeline against the NEMAR-sourced data end to end (real AUC scores, e.g. subject 1: 0.94, subject 35: 0.98) and confirmed `get_subject_info()` returns the expected 60-row table.

## Changelog

Added a `whats_new.rst` entry under the current release section.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3d7d7a280397`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.