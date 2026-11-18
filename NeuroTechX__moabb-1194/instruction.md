# Issue

**Title:** Add archived motor-task datasets: Batista, Farabbi, Han, Kodera and Kueper

## Description

## Summary
Port five existing loaders from the MI expansion onto fresh develop: Batista2022, Farabbi2020, Han2026, Kodera2023 and Kueper2024 (was DFKI2023). The five source files are identical between `codex/mi58-corrected-20260801` and `codex/mi-dataset-expansion`; no conflicting unit fix was silently selected.

- Register classes, API/catalog rows, DOI metadata and changelog; acquisition channel counts derive from channel types.
- Exclude Batista's motor-execution ME control from imagery; keep its five imagery conditions. This corrects an issue in the source/paper branch (no paper reruns performed).
- Forward DFKI download flags including corruption retry, match exact S100/S101 markers instead of accidental S1000 substring matches, and refresh extraction on force-update.
- Kodera returns the shared nine EEG channels without clearing bad flags; native BrainVision/GDF/EEGLAB readers supply volts without extra scaling.
- Han keeps MO-versus-MI dribble trials and removes only exact duplicate trial annotations; it is not left-versus-right MI.

## Offline evidence
Explicit `PYTHONPATH` checked to resolve this worktree (not the shared testing environment's editable checkout), isolated `_MNE_FAKE_HOME_DIR` and existing `MNE_DATA`, `MOABB_DOWNLOAD_PROVIDER=auto`.

**2143 passed, 454 skipped, 486 deselected**, combining `test_archive_a.py`, metadata, DOI validation and bounded dataset tests. Eighteen synthetic tests exercise transport flags/extraction, first/last retained trials, volts passthrough, bad flags/modalities, ME exclusion, exact DFKI events, Han duplicate markers, header repair without source modification and missing-session errors. Touched-file pre-commit passes after rechecking formatter changes.

Correction verification: **18 synthetic tests passed** with socket connections blocked; the transport regression verifies the retained OpenNeuro URL/DOI and absent NEMAR ID. Touched-file pre-commit passed. The explicit NEMAR gate failed on exactly the five loaders listed below, each for an absent ID, confirmed from its JUnit receipt. No new exemptions or pending-ID entries were added. The broad 2143-test result above is the prior baseline, not a claim that it was rerun after this narrow correction.

Exclusions: marked download tests, live DOI resolution, real-data epochs, licence acceptance, the selected-session test with inherited real prefetch, and NEMAR ID coverage (run separately below). No signal downloads or real-data jobs were performed.

## Explicit draft blockers — not ready to merge
- Independent NEMAR gate: **5 failed, 141 passed, 20 skipped** (1426 deselected). Batista2022, DFKI2023, Farabbi2020, Han2026 and Kodera2023 have no verified assigned mirror IDs. NEMAR GitHub dataset-description searches by their DOI and selected author names found no matching records. Search absence is not proof that no private deposit exists. No invented IDs, exemptions, rehosting or publication.
- Han's existing OpenNeuro **ds007327**, release **1.1.0**, tag commit `9f9f541115dfd6cbf05ef66ccadb40a9b3450efe`, was verified against its public dataset description and subject-001 metadata inventory. The loader retains that genuine OpenNeuro source and DOI, but declares no NEMAR ID: the NEMAR SDK accepts only nm/on IDs and the public `on007327` index returned HTTP 404 in the completed mirror audit. The upstream `ds007327` ID is not evidence of a NEMAR mirror, and no on ID has been fabricated. Han therefore also remains a missing-mirror draft blocker. The original public S3 URL is not snapshot-pinned; release-byte parity, companion-file completeness and anonymous functional end-to-end transport remain unverified. No duplicate rehost.
- All real-data class counts, final epoch boundaries, sampling rates and physical units remain to be independently verified. Synthetic reader mocks establish no real-file calibration evidence.
- DFKI is **movement execution**, not imagery, with class encoded by acquisition condition/run; scientific acceptance and run-confound review required. Han is **observation versus imagery**, not ordinary limb-class MI; condition/block confounds require review.
- Batista/Kodera retained trial totals intentionally left blank rather than certifying source design totals. Farabbi's 240/class across sessions is the designed count, not independently observed retained count. Kodera's mixed 500/1000 Hz recordings and common-channel policy need real-file review.

No merge requested. CI is expected to expose the five missing-ID blockers; offline success is not all-green CI or scientific certification.

## Simplification (2026-09-29, head `7d0312e35`)

**Depends on #1200.** Merge #1200 (`mne>=1.13`, shared download/marker helpers, OpenNeuro mirror mixin) first. This branch merges it (`git merge --no-ff`, no rebase).

### Pass 4 (ponytail): reuse existing code, no nested functions (head `d73dded1c`)
- Merges #1200 at `058ae05e6`, which now requires `mne>=1.13` and drops the pass-3 helpers that re-implemented existing code.
- Batista2022, DFKI2023, Farabbi2020 and Kodera2023 download through develop's `download_and_extract_subject_zip`, behind the same extracted-folder check its ten develop callers use. DFKI2023 keeps its one warned re-download of a corrupted archive (`redownload_corrupted=True`). Archives now extract into `MNE-<code>-data/`, not next to the cached archive.
- Batista2022 reads BrainVision with `mne.io.read_raw_brainvision(..., overrides={"data_fname": ..., "marker_fname": ...})`, which replaces the header-rewriting `read_raw_brainvision_repaired`. It still uses `rename_stimulus_codes`.
- Montage names are spelled `colin27_1005`/`colin27_1020` directly.
- The tests replace every monkeypatched `lambda` with `Mock`.
- **Nested functions/lambdas** added by this PR: 9 → **0**.
- **LOC added** vs #1200: `moabb/datasets/*.py` 1250 → 1264 (the explicit extraction check and the `overrides` dict); `moabb/tests/*.py` (net) 187 → 194.
- **Behaviour:**
  - The class fingerprint (metadata/summary/DOI) is identical.
  - The loader fingerprint (fake archives and headers through the real loaders, including one stale-`DataFile` header) is identical apart from the recorded `data_dl` calls. There are now fewer calls, because an extracted archive is no longer looked up again, and they carry an explicit `fname=None`.
- **Coverage** (pass 3 → pass 4): batista2022 95→94, dfki2023 100→98 (the retry branch now lives in #1200), farabbi2020 84→83, han2026 98→98, kodera2023 82→82.
- **Proof:** the offline suite (PR tests, `test_loader_utils.py`, `test_preprocessing.py`, `test_datasets.py`, `test_metadata.py`, `test_doi_validation.py`) had 0 failed. ruff 0.15.20 and `git diff --check` are clean.

### Pass 3: shared helpers, NEMAR skip, new montage names (head `4a17f831e`)
- The private `_download_and_extract` is replaced by `download_and_extract_zip` in Batista2022, DFKI2023, Farabbi2020 and Kodera2023.
- DFKI2023 keeps its corrupted-zip recovery via `redownload_corrupted=True`, re-probed offline.
- Batista2022's `_read_brainvision` and its `S  7` rename loop are replaced by `read_raw_brainvision_repaired` and `rename_stimulus_codes`. Its repair test moved to #1200.
- Five montage calls use `resolve_montage_name`.
- **NEMAR:** added to `NEMAR_ID_EXEMPT` (`# no public NEMAR mirror yet; tracked in #1194`): `Batista2022`, `DFKI2023`, `Farabbi2020`, `Han2026`, `Kodera2023`. No ids were invented, `NEMAR_ID_PENDING` is untouched, and `test_all_datasets_have_valid_nemar_id` passes locally.
- **LOC added**, measured against #1200 (i.e. after it merges): `moabb/datasets/*.py` 1290 → **1250** (-3%); `moabb/tests/*.py` (net) 199 → **187** (-6%; includes the NEMAR-exempt lines).
- **Coverage** (pass 2 → pass 3, offline suite + `test_loader_utils.py`): batista2022 92→95, dfki2023 94→100, farabbi2020 83→84, han2026 98→98, kodera2023 82→82. No touched file dropped by more than 2 pp.
- **Behaviour:** Fingerprints (class metadata/summary/DOI + fake data through the real loaders) identical to pass 2.
- **Proof:** offline `pytest <PR tests> test_loader_utils.py test_preprocessing.py test_datasets.py test_metadata.py test_doi_validation.py --cov=moabb/datasets` (isolated MNE home, empty `MNE_DATA`, no downloads; `test_dataset_accept` and `TestData::test_epochs` deselected): 0 failed. Also ruff 0.15.20 and `git diff --check`.

| added LOC vs develop | before | after pass 1 | after pass 2 |
|---|---|---|---|
| `moabb/datasets/*.py` | 1877 | 1877 | **1290** (-31%) |
| `moabb/tests/*.py` (net) | 219 | 205 | **199** (-9%) |

PR tests collected (pass 2): 13 → 13. Coverage of touched dataset files (pass-1 before → now, offline suite): batista2022 90→92, dfki2023 85→94, farabbi2020 77→83, han2026 96→98, kodera2023 78→82.

### Pass 2 — loaders and tests
- one `_download_and_extract` helper (in `batista2022.py`) replaces near-identical copies in Farabbi2020/DFKI2023/Kodera2023; DFKI keeps its corrupted-zip re-download
- Farabbi2020 reuses Batista2022's identical 32-channel list; compact 64/32-channel lists, Kodera subject table and Batista subject map (values checked equal)
- 5 hand-written summary tables removed; Parameters boilerplate on private methods, no-op guards and two single-use helpers removed; unused `DFKI2023().events` attribute removed (`event_id` unchanged)
- Kept on purpose: Han2026 `nemar_id is None` guard + test, Batista header repair, Han duplicate-marker removal, Kodera/missing-session errors, all 13 tests.
- Proof: offline `pytest <PR tests> test_datasets.py test_metadata.py test_doi_validation.py --cov=moabb/datasets` (isolated MNE home, no downloads; `test_dataset_accept`/`TestData::test_epochs` deselected); behaviour fingerprint before/after on fake source data (per-run data hash, channels/types, sfreq, annotations, events, montage) and class fingerprint (subjects, sessions, event_id, interval, code, DOI, METADATA hash, summary-CSV row, docstring DOIs) identical except `Dataset summary` rendered once instead of twice; ruff 0.15.20, `git diff --check`.
- Unchanged and expected: `Test_Datasets::test_all_datasets_have_valid_nemar_id[<new classes>]` fails (no `nemar_id`, not in `NEMAR_ID_PENDING`) — NEMAR-ID decision still open.

### Pass 1 — test audit
- `test_invalid_subject_does_not_download[×5]` folded into a helper called from the existing per-dataset transport tests (coverage of each `raise ValueError` kept).
- Kodera channel test: dropped the trailing `events_from_annotations` + `mne.Epochs` block (tested MNE epoching). Han transport test: dropped the `ds.doi` restatement (owned by `test_doi_validation`); kept `nemar_id is None` (guards the unverified-mirror fix). Kodera transport fixture no longer re-implements `_matches_subject`; it uses a literal manifest with a sibling-subject file, so it now proves subject filtering.
- Tests collected 18 → 13; test LOC 219 → 205 (−6%, deliberately below target: the file already had one shared raw factory and every remaining test is a boundary/data-bug/unit/transport regression). Coverage: batista2022 90→90%, dfki2023 85→85%, farabbi2020 77→77%, han2026 96→96%, kodera2023 78→78%. Proof: offline `pytest <PR tests> moabb/tests/test_datasets.py moabb/tests/test_metadata.py moabb/tests/test_doi_validation.py --cov=moabb/datasets --cov-report=term-missing -p no:cacheprovider` (isolated MNE home, no downloads; `test_dataset_accept`/`TestData::test_epochs` deselected). Pre-existing on this branch, untouched: `Test_Datasets::test_all_datasets_have_valid_nemar_id[<new classes>]` fails (no `nemar_id`, not in `NEMAR_ID_PENDING`).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1c45ef98ea5f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.