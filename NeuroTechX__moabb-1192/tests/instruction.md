# Issue

**Title:** feat(datasets): add Shin2022 and NeuroTUMBCI2025 continuous MI readers

## Description

## Summary
Port two continuous-recording MI loaders onto develop: **Shin2022** (16-channel BCI2000 LIVE EEG only) and **NeuroTUMBCI2025** (was neuroTUMBCI) (24-channel XDF, two participants with subject-specific three-class tasks).

- Registration, API docs, catalog/CSV metadata, every cited DOI cache entry, and offline regression tests.
- Shin2022 handles Feedback active at sample zero and at the final sample; synthetic tests verify annotations and µV-to-V scaling.
- BCI2kReader is lazy-imported and available through the new `bci2000` optional extra. No obsolete `external` extra. neuroTUM uses develop's existing native XDF reader instead of adding pyxdf; h5py/pymatreader are already core dependencies.
- neuroTUM metadata represents the union of four labels, not an assertion that each participant has four classes. Session counts vary (5/3); unavailable aggregate trial counts are left blank rather than fabricated.

## Source reconciliation
Compared `codex/mi58-corrected-20260801` with `bruaristimunha-fork/codex/mi-dataset-expansion` file-by-file: all four extra-reader source modules are identical. This port adapts continuous readers to current metadata and selection APIs and removes obsolete `n_channels` fields.

## Local checks (isolated fake MNE home, existing temporary data directory, PYTHONPATH verified)
- Synthetic readers + full metadata + offline DOI suite: **939 passed, 217 skipped, 298 deselected** (network-marked DOI cases excluded).
- Explicit safe dataset-interface/provider selection: **90 passed, 85 skipped, 1390 deselected**.
- Pre-commit on all touched files: passed after reviewing formatting fixes.
- NEMAR-ID gate deliberately run for both new classes: **2 failures**, both `nemar_id is None`. No fake ID, exemption, or unassigned pending entry was added.
- Full dataset suite not executed: it contains real-data/network paths (including TestData epochs, dataset acceptance and real-raw metadata checks). No real recordings downloaded, no laptop experiments, no Voyager jobs.

## Draft / merge blockers
1. **No genuine public NEMAR mirror identified** for Shin2022 (10.6084/m9.figshare.20383716) or neuroTUMBCI (10.5281/zenodo.18087806). The public `nemarDatasets` GitHub catalog was paginated (787 entries) and descriptions searched; web-search provider also failed. This is a bounded search, not proof that no mirror exists. nm000267/nm000268 are Shin2017, nm000339 is Stieger2021: none is a substitute. Keep draft until authentic mirrors and appropriate source-byte transport are verified. No rehosting/publication was performed.
2. Real-release units, BCI2000 calibration/hand mapping, variable Feedback lengths versus the fixed 3-second default, XDF clock alignment and complete session/event inventories remain scientifically unverified by this port. Synthetic scaling does not establish the source units.
3. **InEarMI2026 deferred**: source concatenates de-meaned trial windows with synthetic padding, requests `[0,5]` inclusive despite fixed stored windows, and does not protect discontinuities through preprocessing. A scientifically safe epoched representation requires separate work; source metadata also claimed seven channels despite returning the common two-ear pair.
4. **SensoryGuidedMI2026 deferred**: source concatenates variable-length trials into fictitious continuity, lacks filter boundary preservation, and a fixed 4-second interval may cross trial boundaries. Target-label/axis semantics and missing/corrupt-run policy need release validation. The source's fabricated `nemar_id = "EXEMPT"` is not ported.

This PR is intentionally draft and must not merge with missing mirror/scientific evidence. No paper experiments rerun; findings above also affect the source-branch loaders.

## Simplification (2026-09-29, head `159623a41`)

**Depends on #1200.** Merge #1200 (`mne>=1.13`, shared download/marker helpers, OpenNeuro mirror mixin) first. This branch merges it (`git merge --no-ff`, no rebase).

### Pass 4 (ponytail): reuse existing code, no nested functions (head `44cd3f4d2`)
- Merges #1200 at `058ae05e6`, which now requires `mne>=1.13` and drops `resolve_montage_name`.
- neuroTUMBCI spells its montage `colin27_1020` directly.
- The tests replace every monkeypatched or bound `lambda` with `Mock`, including the stand-in `BCI2kReader`. They now assert on `call_args` instead of appending to a call list.
- **Nested functions/lambdas** added by this PR: 6 → **0** (5 lambda-patch, 1 lambda-bound).
- **LOC added** vs #1200: `moabb/datasets/*.py` 540 → 538; `moabb/tests/*.py` (net) 98 → 97.
- **Behaviour:**
  - The class fingerprint (metadata/summary/DOI) is identical.
  - The explicit neuroTUMBCI fingerprint is identical.
  - The loader fingerprint (a fake BCI2000 reader, a fake Figshare zip and fake XDF streams through the real loaders) is fully identical.
- **Coverage** (pass 3 → pass 4): neurotumbci 85→84 (one fewer statement after the import was removed), shin2022 74→74.
- **Proof:** the offline suite (PR tests, `test_loader_utils.py`, `test_preprocessing.py`, `test_datasets.py`, `test_metadata.py`, `test_doi_validation.py`) had 2522 passed and 0 failed. ruff 0.15.20 and `git diff --check` are clean.

### Pass 3: shared helpers, NEMAR skip, new montage names (head `689c03b4d`)
- The neuroTUMBCI montage uses `resolve_montage_name`.
- Shin2022 extracts only the members it needs, so it keeps its own extraction code. The `Extraction failed` error is unchanged and was re-probed.
- **NEMAR:** added to `NEMAR_ID_EXEMPT` (`# no public NEMAR mirror yet; tracked in #1192`): `Shin2022`, `neuroTUMBCI`. No ids were invented, `NEMAR_ID_PENDING` is untouched, and `test_all_datasets_have_valid_nemar_id` passes locally.
- **LOC added**, measured against #1200 (i.e. after it merges): `moabb/datasets/*.py` 538 → **540** (+0%); `moabb/tests/*.py` (net) 96 → **98** (+2%; includes the NEMAR-exempt lines).
- **Coverage** (pass 2 → pass 3, offline suite + `test_loader_utils.py`): neurotumbci 84→85, shin2022 74→74. No touched file dropped by more than 2 pp.
- **Behaviour:** Fingerprints (class metadata/summary/DOI + fake data through the real loaders) identical to pass 2 (including the explicit neuroTUMBCI class list).
- **Proof:** offline `pytest <PR tests> test_loader_utils.py test_preprocessing.py test_datasets.py test_metadata.py test_doi_validation.py --cov=moabb/datasets` (isolated MNE home, empty `MNE_DATA`, no downloads; `test_dataset_accept` and `TestData::test_epochs` deselected): 0 failed. Also ruff 0.15.20 and `git diff --check`.

| added LOC vs develop | before | after pass 1 | after pass 2 |
|---|---|---|---|
| `moabb/datasets/*.py` | 726 | 726 | **538** (-26%) |
| `moabb/tests/*.py` (net) | 96 | 96 | **96** (+0%) |

PR tests collected (pass 2): 8 → 8. Coverage of touched dataset files (pass-1 before → now, offline suite): shin2022 71→74, neurotumbci 86→84.

### Pass 2 — loaders and tests
- neuroTUMBCI: hand-written summary table removed, 24-line channel list → one `.split()`, `data_path` as one comprehension
- Shin2022: shorter docstrings, `_live_top_dir` inlined, unreachable feedback-edge branches and duplicate SIMULATED check removed; explicit `Extraction failed` error kept
- Kept on purpose: all 8 tests; fail-closed `No LIVE recordings` / `No .dat` errors; re-extraction rule.
- Proof: offline `pytest <PR tests> test_datasets.py test_metadata.py test_doi_validation.py --cov=moabb/datasets` (isolated MNE home, no downloads; `test_dataset_accept`/`TestData::test_epochs` deselected); behaviour fingerprint before/after on fake source data (per-run data hash, channels/types, sfreq, annotations, events, montage) and class fingerprint (subjects, sessions, event_id, interval, code, DOI, METADATA hash, summary-CSV row, docstring DOIs) identical except `Dataset summary` rendered once instead of twice; ruff 0.15.20, `git diff --check`.
- Unchanged and expected: `Test_Datasets::test_all_datasets_have_valid_nemar_id[<new classes>]` fails (no `nemar_id`, not in `NEMAR_ID_PENDING`) — NEMAR-ID decision still open.

### Pass 1 — test audit
- Audited `test_mi_readers.py` (8 tests, 96 LOC) against the junk patterns: every test maps to a distinct owner-boundary contract (BCI2000 Feedback edges + µV→V incl. first-sample onset and unterminated last block; LIVE-only zip extraction over a real archive; XDF mapping/timing/units; missing-stream error; per-class `data_path` guards). Nothing justified removal for ≤ 2 LOC each, so no trim was made. No test-only production seams.
- Coverage (offline): neurotumbci 86%, shin2022 71%. Proof: offline `pytest <PR tests> moabb/tests/test_datasets.py moabb/tests/test_metadata.py moabb/tests/test_doi_validation.py --cov=moabb/datasets --cov-report=term-missing -p no:cacheprovider` (isolated MNE home, no downloads; `test_dataset_accept`/`TestData::test_epochs` deselected). Pre-existing on this branch, untouched: `Test_Datasets::test_all_datasets_have_valid_nemar_id[<new classes>]` fails (no `nemar_id`, not in `NEMAR_ID_PENDING`).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b15b20f277b1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.