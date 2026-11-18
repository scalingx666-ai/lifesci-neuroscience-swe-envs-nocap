# Issue

**Title:** feat(datasets): add Pan cross-session and Polo lower-limb MI datasets

## Description

## Summary
Adds three existing source loaders ported onto current develop: Pan2023, Pan2025 and PoloHortiguela2025. Registers metadata, API docs, summary rows and cached DOI citations.

- Pan MAT readers convert microvolts to volts, validate label/window counts, and use inclusive 3.996-second endpoints (1000 actual samples) rather than borrowing a sample from the next stored trial or dropping the last.
- Non-rejecting EDGE boundary annotations mark stored-trial discontinuities; a narrowly scoped preprocessing fix preserves them through event reconstruction. Synthetic tests compare filtering against independently filtered trials.
- Polo tests cover both STATIC/MOTION task-code variants, EEG/EOG SI scaling without scaling inertial channels, sample-zero annotations, and transport-only mocked ZIP extraction/flags.
- CSV trials/class is across sessions (Pan2023:120; Pan2025:180). Polo mean is 33/class across sessions, reflecting 44 rest +22 imagery rather than falsely claiming balance.

## Reconciliation and exclusions
Compared corrected source f7fe4b041a25bf24ad5d76e0dcdeaf1f1f6f12f0 and expansion 4e7771cd99a4335e29eb6c8975bb546c01d00e2f file by file; these three are identical across them.
Deferred Lomele2026: source explicitly describes overt reach/grasp/lift but assigns imagery; not legitimate to port that classification into this MI batch.
Deferred Lu2026: source concatenates EEGdata without physical scaling/calibration evidence and ignores configuration_channel masks; real-file units/bad-channel interpretation must be established before a scientifically defensible port.

## Validation
Isolated MNE home/data directories, explicit worktree import. Offline suite: 2084 passed, 485 skipped, 467 deselected; 7 focused synthetic tests included. Touched-file pre-commit passes. Explicit exclusions: network-marked tests, real-data test_epochs, test_dataset_accept, selected-session inherited prefetch, and the separately measured NEMAR policy gate. No real downloads or Voyager jobs.

## Draft blockers — do not merge
NEMAR gate currently has 3 expected failures (one per added class). Read-only discovery enumerated 787 actual nemarDatasets repositories and their descriptions; no matching mirror was confirmed. The superficially relevant nm000152 was checked against dataset_description.json and is Zhang2017 (version 1.0.3), not one of these datasets. Search-provider failure limits additional discovery. No fabricated IDs/versions, exemptions, pending entries or rehosting. Real-data counts, source-unit calibration, exceptional sessions and channel flags still require authorized server-side validation. Full CI is not asserted green.

## Simplification (2026-09-29, head `dfc92e892`)

**Depends on #1200.** Merge #1200 (`mne>=1.13`, shared download/marker helpers, OpenNeuro mirror mixin) first. This branch merges it (`git merge --no-ff`, no rebase).

### Pass 4 (ponytail): reuse existing code, no nested functions (head `849053677`)
- Merges #1200 at `058ae05e6`, which now requires `mne>=1.13` and drops the pass-3 helpers that re-implemented existing code.
- PoloHortiguela2025 downloads through develop's `download_and_extract_subject_zip`, behind the same extracted-folder check its ten develop callers use. It keeps `fname=` because every Zenodo `/content` URL would otherwise share one cache name, and it keeps the one warned re-download of a corrupted archive (`redownload_corrupted=True`). Archives now extract into `MNE-polohortiguela2025-data/`, not next to the cached archive.
- Pan2023/Pan2025 (`_trials_to_raw`) mark stored-trial joins with `mne.Annotations(joins, 0.0, "EDGE boundary")`, which replaces `edge_boundary_annotations`.
- Montage names are spelled `colin27_1005` directly.
- **Nested functions/lambdas** added by this PR: 0 → **0**.
- **LOC added** vs #1200: `moabb/datasets/*.py` 543 → 543; `moabb/tests/*.py` (net) 107 → 109 (the transport test now also checks the extracted files).
- **Behaviour:**
  - The class fingerprint (metadata/summary/DOI) is identical.
  - The loader fingerprint (real HDF5/MAT files and real zips through the real loaders) is identical.
- **Coverage** (pass 3 → pass 4): pan2023 88→88, pan2025 100→100, polohortiguela2025 82→81 (the retry branch now lives in #1200).
- **Proof:** the offline suite (PR tests, `test_loader_utils.py`, `test_preprocessing.py`, `test_datasets.py`, `test_metadata.py`, `test_doi_validation.py`) had 2525 passed, 0 failed. ruff 0.15.20 and `git diff --check` are clean.

### Pass 3: shared helpers, NEMAR skip, new montage names (head `2adfdf5dc`)
- PoloHortiguela2025's two-attempt loop is replaced by `download_and_extract_zip(..., fname=..., redownload_corrupted=True)`. The corrupted-zip recovery was re-probed offline: warn, forced re-download, extract; a second corruption raises.
- Pan2023 uses `edge_boundary_annotations`.
- The montage calls use `resolve_montage_name`. The warning filter that hid the MNE montage-name deprecation is gone.
- The `preprocessing.py` change is now owned by #1200.
- **NEMAR:** added to `NEMAR_ID_EXEMPT` (`# no public NEMAR mirror yet; tracked in #1197`): `Pan2023`, `Pan2025`, `PoloHortiguela2025`. No ids were invented, `NEMAR_ID_PENDING` is untouched, and `test_all_datasets_have_valid_nemar_id` passes locally.
- **LOC added**, measured against #1200 (i.e. after it merges): `moabb/datasets/*.py` 565 → **543** (-4%); `moabb/tests/*.py` (net) 104 → **107** (+3%; includes the NEMAR-exempt lines).
- **Coverage** (pass 2 → pass 3, offline suite + `test_loader_utils.py`): pan2023 88→88, pan2025 100→100, polohortiguela2025 75→82. No touched file dropped by more than 2 pp.
- **Behaviour:** Fingerprints (class metadata/summary/DOI + fake data through the real loaders) identical to pass 2.
- **Proof:** offline `pytest <PR tests> test_loader_utils.py test_preprocessing.py test_datasets.py test_metadata.py test_doi_validation.py --cov=moabb/datasets` (isolated MNE home, empty `MNE_DATA`, no downloads; `test_dataset_accept` and `TestData::test_epochs` deselected): 0 failed. Also ruff 0.15.20 and `git diff --check`.

| added LOC vs develop | before | after pass 1 | after pass 2 |
|---|---|---|---|
| `moabb/datasets/*.py` | 854 | 854 | **565** (-34%) |
| `moabb/tests/*.py` (net) | 116 | 110 | **104** (-10%) |

PR tests collected (pass 2): 7 → 7. Coverage of touched dataset files (pass-1 before → now, offline suite): pan2023 82→88, pan2025 83→100, polohortiguela2025 70→75, preprocessing 40→40.

### Pass 2 — loaders and tests
- Pan2023/Pan2025 share a private base class and one `_trials_to_raw`; Pan2025 reuses Pan2023's URL constant and channel list; `h5py` optional-import fallback removed (core dependency)
- PoloHortiguela2025 uses develop's `dl.data_dl(..., fname=)` (as `schrag2026.py` does), removing ~60 lines of workaround for every Zenodo `/content` file being cached as `content`; corrupted-zip re-download kept
- 3 hand-written summary tables removed; shorter docstrings
- Kept on purpose: `preprocessing.py` EDGE-boundary change + test, label/imagery-window checks, Polo warning suppression, empty-condition skip.
- Proof: offline `pytest <PR tests> test_datasets.py test_metadata.py test_doi_validation.py --cov=moabb/datasets` (isolated MNE home, no downloads; `test_dataset_accept`/`TestData::test_epochs` deselected); behaviour fingerprint before/after on fake source data (per-run data hash, channels/types, sfreq, annotations, events, montage) and class fingerprint (subjects, sessions, event_id, interval, code, DOI, METADATA hash, summary-CSV row, docstring DOIs) identical except `Dataset summary` rendered once instead of twice; ruff 0.15.20, `git diff --check`.
- Unchanged and expected: `Test_Datasets::test_all_datasets_have_valid_nemar_id[<new classes>]` fails (no `nemar_id`, not in `NEMAR_ID_PENDING`) — NEMAR-ID decision still open.

### Pass 1 — test audit
- `test_stored_windows[Pan2023|Pan2025]`: the `raw.filter` vs `crop().filter()` round-trip (which verifies MNE's `skip_by_annotation`, not moabb) replaced by a direct assertion that the `EDGE boundary` onset equals the stored-trial join. Nothing else matched a junk pattern; file was already lean.
- Retained on purpose: `data_path(0)` guard (only owner, −2.6 pp otherwise), both Pan transport tests (separate manifests), Polo STATIC/MOTION code-bug params, Zenodo `/content` zip transport mock, last-trial Epochs shape.
- Tests collected 7 → 7; test LOC 116 → 110 (−5%). Coverage: pan2023 82→82%, pan2025 83→83%, polohortiguela2025 70→70%, preprocessing 40→40%. Proof: offline `pytest <PR tests> moabb/tests/test_datasets.py moabb/tests/test_metadata.py moabb/tests/test_doi_validation.py --cov=moabb/datasets --cov-report=term-missing -p no:cacheprovider` (isolated MNE home, no downloads; `test_dataset_accept`/`TestData::test_epochs` deselected). Pre-existing on this branch, untouched: `Test_Datasets::test_all_datasets_have_valid_nemar_id[<new classes>]` fails (no `nemar_id`, not in `NEMAR_ID_PENDING`).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4cc95b09e8e8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.