# Issue

**Title:** Add OpenNeuro motor-imagery datasets Peterson2020, Daly2020 and Damm2026

## Description

## Summary

Adds three OpenNeuro/BIDS **motor-imagery** loaders on current develop: Peterson2020 (formerly `Peterson2022` in this PR; renamed to the Heliyon 2020 paper year) (`ds003810`), Daly2020 (`ds002720`), and Damm2026 (`ds008446`), with registration, summary rows, metadata, API docs, citation cache, and synthetic regressions. This is a separate batch from #1186, #1188 and #1178; no overlapping loaders.

### Reconciliation and protocol decisions
- Compared `codex/mi58-corrected-20260801` against `codex/mi-dataset-expansion` file by file. Daly and Damm match. For Peterson retain the paper-side EDF `units="uV"` reader declaration and versioned raw-cache pipeline, **not** the expansion branch's unconditional post-read `1e-6` multiplication. The source channels sidecar is documented as microvolts despite blank EDF physical dimensions. This needs real-file reconfirmation on this head.
- **Cai2026 intentionally deferred/excluded:** its IACKD protocol is movement preparation followed by executed ball-steering/reaching, not instructed motor imagery. The old four-second window begins at a roughly one-second premove phase and includes execution; hand labels are also acquisition-block labels. Including it silently in MI would be misleading. A separately reviewed movement-preparation/execution classification and suitable windows are required.
- Peterson excludes real-movement RUN0, exposes runs 1–4, and corrects summary counts to designed 80 trials/class per subject (160 total).
- Daly maps lower alpha to right-hand ball-squeeze imagery and raise alpha to relaxation. Calibration and targetless runs are skipped; duplicate task/run files raise. Summary counts are the **design** (72/class across 8 runs), not verified retained means. The release has 18 subjects despite README prose saying 19; machine-readable CC0 conflicts with README CC-BY-4.0.
- Damm reconstructs marker-block onsets from the release's per-sample TSV using `round(onset * sfreq**2)` and keeps only five finger cues. This release-specific timestamp correction and designed 60/class require real-file validation.

### Correctness and compatibility
- Remove obsolete acquisition `n_channels`; derive counts from channel types.
- Forward path/force_update/verbose to transport (update_path remains deprecated compatibility argument).
- BIDS downloads use existing `data_dl` and exact relative filenames; missing required files now fail instead of silently accepting 404s.
- Remove native stim channels before constructing the single authoritative STIM channel, preventing duplicate native/annotation events. Preserve EEG SI values and bad-channel flags; no interpolation or clearing bads.
- Real protocol differences (music feedback, rest contrast, finger ordering) remain documented rather than treated as interchangeable left/right MI.

## Validation

**Draft: real-data validation is outstanding.** No EEG downloads or experiments ran locally, and no new Voyager job was started. No data rehosting/publication/merge is part of this PR.

Explicit `PYTHONPATH` verified `moabb.__file__` points at this worktree; reused the existing dependency environment without editing another worktree. Isolated `_MNE_FAKE_HOME_DIR`, existing temporary `MNE_DATA`, and `MOABB_DOWNLOAD_PROVIDER=auto`.

```
python -m pytest moabb/tests/test_metadata.py moabb/tests/test_datasets.py \
  moabb/tests/test_doi_validation.py moabb/tests/test_daly2020_regression.py \
  moabb/tests/test_openneuro_batch2.py \
  -m 'not network and not download' \
  -k 'not test_epochs and not test_dataset_accept and not test_selected_sessions_accept_unpadded_integer' \
  -o addopts='' -q
```

Result: **2244 passed, 331 skipped, 466 deselected**. The explicit extra exclusions avoid unmarked real-data/prefetch paths in the broad suite. Twelve focused tests cover transport-only mocks, inherited BIDS flags, first/last trials, native stim removal, SI preservation, bad-channel preservation, missing/duplicate runs and empty event TSVs. All touched-file pre-commit hooks pass.

DOI cache entries were preserved from the source branch; the additional Peterson data DOI was checked against DataCite metadata (metadata only, no dataset download).

Before ready/merge: Voyager-only released-file smoke tests on this exact head, compare event counts and onsets directly with annotations/TSVs, confirm SI units from EDF headers/sidecars, verify Peterson's unit override, Daly exceptional empty runs and retained counts, Damm timestamp reconstruction, and actual default EEG channel counts including bads. Public S3 paths are unversioned even though citations identify release versions; no snapshot immutability claim is made. CI state must be checked for the exact head and is not implied by local success.

## Simplification (2026-09-29, head `210cff4c2`)

**Depends on #1200.** Merge #1200 (`mne>=1.13`, shared download/marker helpers, OpenNeuro mirror mixin) first. This branch merges it (`git merge --no-ff`, no rebase).

### Pass 4 (ponytail): reuse existing code, no nested functions (head `a71359d2e`)
- Merges #1200 at `058ae05e6`, which now requires `mne>=1.13` and keeps only `OpenNeuroMirrorMixin` in `_openneuro_mirror.py`.
- Daly2020, Damm2026 and Peterson2022 drop the native trigger channel with `raw.drop_channels(...)` over its `stim`-typed channels, which replaces `drop_native_stim`. They do not use `mne.pick_types`, because that also drops bad channels.
- Daly2020 and Peterson2022 relabel markers with `raw.annotations.rename(...)`, restricted to the descriptions that are present. This replaces `relabel_annotations`.
- Their upstream stub `dataset_description.json` is written by `mne_bids.make_dataset_description`, which replaces `write_dataset_description`.
- Daly2020's nested `_run_number` is now a module-level function. `mne_bids` is imported at module level.
- Damm2026 spells `colin27_1005` directly.
- The tests replace every monkeypatched `lambda` with `Mock`. The Daly run-skipping test now also asserts which runs were read.
- **Nested functions/lambdas** added by this PR: 13 → **0**.
- **LOC added** vs #1200: `moabb/datasets/*.py` 733 → 763 (the inlined stim-channel and rename comprehensions, three call sites); `moabb/tests/*.py` (net) 192 → 193.
- **Behaviour:**
  - The class fingerprint (metadata/summary/DOI) is identical.
  - The loader fingerprint (fake EDF/BIDS data through the real loaders, plus mocked download manifests) is identical except in the two upstream `dataset_description.json` files, which mne-bids now writes:
    - `BIDSVersion` changes to mne-bids' `1.9.0` (Daly2020 was `1.0.2`, Peterson2022 was `1.1.1`).
    - Each file gains `DatasetType: raw` and `GeneratedBy` (MNE-BIDS).
    - `DatasetDOI` gains the `doi:` prefix.
  - Name, License and Authors are unchanged.
- **Coverage** (pass 3 → pass 4): daly2020 94→95, damm2026 99→99, peterson2022 99→99.
- **Proof:** the offline suite (PR tests, `test_loader_utils.py`, `test_preprocessing.py`, `test_datasets.py`, `test_metadata.py`, `test_doi_validation.py`) passed 2546 tests with 0 failed. ruff 0.15.20 and `git diff --check` are clean.

### Pass 3: shared helpers, NEMAR skip, new montage names (head `2a83dc44b`)
- The duplicate `_openneuro_mirror.py` is now #1200's file (byte-identical), so the follow-up to drop it after #1186 is done.
- The single-case `test_provider_policy` is removed; #1200 owns the mixin tests.
- The Damm2026 montage uses `resolve_montage_name`.
- **NEMAR:** none needed (all three classes have OpenNeuro ids). `NEMAR_ID_PENDING` is untouched, and `test_all_datasets_have_valid_nemar_id` passes locally.
- **LOC added**, measured against #1200 (i.e. after it merges): `moabb/datasets/*.py` 814 → **733** (-10%); `moabb/tests/*.py` (net) 213 → **192** (-10%; includes the NEMAR-exempt lines).
- **Coverage** (pass 2 → pass 3, offline suite + `test_loader_utils.py`): daly2020 94→94, damm2026 99→99, peterson2022 99→99. No touched file dropped by more than 2 pp.
- **Behaviour:** Fingerprints (class metadata/summary/DOI + fake data through the real loaders) identical to pass 2.
- **Proof:** offline `pytest <PR tests> test_loader_utils.py test_preprocessing.py test_datasets.py test_metadata.py test_doi_validation.py --cov=moabb/datasets` (isolated MNE home, empty `MNE_DATA`, no downloads; `test_dataset_accept` and `TestData::test_epochs` deselected): 0 failed. Also ruff 0.15.20 and `git diff --check`.

| added LOC vs develop | before | after pass 1 | after pass 2 |
|---|---|---|---|
| `moabb/datasets/*.py` | 1050 | 1050 | **814** (-22%) |
| `moabb/tests/*.py` (net) | 357 | 247 | **213** (-40%) |

PR tests collected (pass 2): 15 → 15. Coverage of touched dataset files (pass-1 before → now, offline suite): _openneuro_mirror 94→93, daly2020 93→94, damm2026 96→99, peterson2022 95→99.

### Pass 2 — loaders and tests
- same `_openneuro_mirror.py` helpers as #1186 (byte-identical copy)
- Daly/Peterson channel lists as `.split()`; Lee/LioiXP1/Damm-style shared stem list for mirror+upstream branches; shorter docstrings
- `test_openneuro_mirror.py` folded into `test_openneuro_batch2.py` (both PRs added a file with that name → merge conflict avoided); repeated loader asserts → `_assert_loaded`
- Kept on purpose: Daly duplicate-run / no-usable-runs errors, Damm empty `events.tsv` branch, single `test_provider_policy` (drop on rebase over #1186).
- Proof: offline `pytest <PR tests> test_datasets.py test_metadata.py test_doi_validation.py --cov=moabb/datasets` (isolated MNE home, no downloads; `test_dataset_accept`/`TestData::test_epochs` deselected); behaviour fingerprint before/after on fake source data (per-run data hash, channels/types, sfreq, annotations, events, montage) and class fingerprint (subjects, sessions, event_id, interval, code, DOI, METADATA hash, summary-CSV row, docstring DOIs) identical except `Dataset summary` rendered once instead of twice; ruff 0.15.20, `git diff --check`.

### Pass 1 — test audit
- `test_openneuro_mirror.py` reduced to the dataset-specific mirror-flag cases (NEMAR ids, subject labels, target dirs). The shared `OpenNeuroMirrorMixin` contract (SDK raw selection with mocked HTTP transport, `get_data` prefetch guard) is **owned by #1186**; a single-case `test_provider_policy` remains only so this branch covers its own copy of `_openneuro_mirror.py` — delete it when rebasing on #1186.
- `test_bids_flag_contract` removed: neither Daly2020 nor Peterson2022 overrides `BaseBIDSDataset.data_path`; forwarding is owned by `Test_Datasets::test_data_path_uses_download_flags`.
- `test_daly2020_regression.py` folded into `test_openneuro_batch2.py` (one raw fixture instead of two copies). A Peterson2022 `get_data` case is retained because it overrides the process pipeline (cache version) on top of the mixin.
- Tests collected across PR files 25 → 16; PR test LOC 405 → 295 (−27%). Coverage: `_openneuro_mirror.py` 94→94%, `daly2020.py` 93→93%, `damm2026.py` 96→96%, `peterson2022.py` 95→95%. Proof: same offline coverage command as #1186 (2427 → 2418 passed, 0 failed).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `89a1f3de7976`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.