# Issue

**Title:** Add large-recording motor datasets: NeBULA2025, MIND, MOVING and Thapa

## Description

## Scope
Four large-recording motor-task loaders: **NeBULA2025 (was Garro2025), MIND2026, MOVING2024, Thapa2025**. Based on develop `18e7d4c03`; reconciled `codex/mi58-corrected-20260801` against fork `codex/mi-dataset-expansion` (`4e7771cd`). Only MIND differs among these loaders; the corrected acquisition-restart guard is retained, including balanced-suffix and task-half-order checks.

**DRAFT — not merge-ready.** No real dataset downloads, computation jobs, rehosting, or publication were performed for this PR.

## Scientific review and changes
- Defer **Ding2025**: source infers physical units from signal amplitude (`max(abs(data)) > 1e-3`), which is not a valid calibration. Requires authoritative unit evidence before porting; paper-branch results may be affected.
- Garro/Thapa are explicitly motor **execution**, not imagined movement; retain MOABB's existing imagery umbrella. Garro uses Go cues rather than target-reached events; subject 28 has no released recording.
- Preserve MIND's corrected restart handling rather than blindly trimming overfull streams. Document the acquisition-half confound (codes 4/5 then 6/7); four-class scores need careful interpretation.
- Document MOVING's fixed within-block movement order and unequal class counts (24 rest, 8 per movement). Reject duplicate subject EDFs.
- Tighten Thapa target parsing to avoid classifying `Tgt10` or arbitrary substrings. Preserve irregular optional TSV fields and temporary header-reference repair. Use standard montage and explicit execution metadata.
- Forward path/force_update/verbose through downloads, honor forced refresh even with extracted caches, and search Garro tasks within the requested subject.
- Channel counts derive from channel_types; update registration, API docs, imagery CSV, metadata count, and all six cited DOI cache entries. CSV trials/class are per-subject totals/means; Thapa 74 is the cohort mean, not balance; MOVING is 12 mean with 24/8/8/8 distribution.
- No new zip/7z helper: selected loaders use standard zip extraction or existing RAR support. Deflate64 on a real release remains unverified rather than introducing an untested broad fallback.

## Verification
Existing sibling interpreter lacked pytest and remotezip. Installed test-only dependencies into this worktree's untracked `.test-deps`; no sibling environment modified. Explicit PYTHONPATH resolved `moabb.__file__` to this worktree. Isolated `_MNE_FAKE_HOME_DIR`, existing MNE_DATA, provider=auto.

- Bounded offline suite: **2124 passed, 479 skipped, 469 deselected** (metadata, dataset registration/contracts, cached DOI validation, MIND/Thapa/source irregularity tests, and new synthetic batch tests).
- Exclusions: live DOI/network resolution; `test_epochs` real BNCI data; `test_dataset_accept` license/network access; mirror-ID gate run separately below. Existing suite skips retained. No permanent skips/exemptions added.
- Separate mirror gate: **141 passed, 20 skipped, 4 failed** — precisely the four new loaders have no verified NEMAR IDs.
- Touched-file pre-commit and `git diff --check` pass.
- Synthetic tests cover first/last events, no double SI scaling, bad-channel preservation, restart failures, missing/duplicate sessions/runs, both MOVING modalities, and actual extraction with only transport mocked for ZIP loaders.

## Required draft blockers
1. **Real-data verification on authorized compute host** for subject/run inventory, source labels/onsets, native physical units, inclusive epoch bounds, channel flags and compression support. Synthetic unit tests are not real-data validation.
2. **Actual public NEMAR mirrors for all four loaders.** No fake IDs, exemptions, or invented pending deposits. Web-search provider failed; GitHub public nemarDatasets repository searches for NeBULA, Thapa, MOVING, unilateral, reaching, and Virtual Glove found no matching deposit. MIND-name candidate `on004107` is unrelated 2007 MEG (Weisend et al.), verified from dataset_description.json; other MIND matches are unrelated LEMON/mind-wandering/locomotion. Absence of search results is not proof that no deposit exists; administrators may supply real IDs.
3. Scientific review of acquisition-order confounds in MIND/MOVING and execution-only catalog presentation.

No merge requested. Expected mirror-test failures are visible intentionally, not hidden by exemptions.

## Simplification (2026-09-29, head `fafc1b712`)

**Depends on #1200.** Merge #1200 (`mne>=1.13`, shared download/marker helpers, OpenNeuro mirror mixin) first. This branch merges it (`git merge --no-ff`, no rebase).

### Pass 4 (ponytail): reuse existing code, no nested functions (head `d815f475a`)
- Merges #1200 at `058ae05e6`, which now requires `mne>=1.13` and drops the pass-3 helpers that re-implemented existing code.
- Thapa2025 reads BrainVision with `mne.io.read_raw_brainvision(..., overrides={"data_fname": ..., "marker_fname": ...})`, which replaces `read_raw_brainvision_repaired(strict=True)`. MNE itself raises `FileNotFoundError` when a sibling file is missing.
- Garro2025 no longer has its nested `local_or_download`. That function only skipped `data_dl` when `MNE-garro2025-data/files/<id>` existed, and that path is already `data_dl`'s own cache for the Figshare URL, so the loader now calls `dl.data_dl` directly.
- MIND2026's nested count formatter is now a module-level `_format_counts`, and its sort key is `operator.itemgetter(0)`.
- Montage names are spelled `colin27_1005`/`colin27_1020` directly.
- The tests replace the three nested `data_dl` recorders and every monkeypatched `lambda` with `Mock`.
- **Nested functions/lambdas** added by this PR: 14 (5 nested defs, 7 patch lambdas, 2 sort keys) → **1**. The remaining one is Thapa2025's `sorted(..., key=lambda s: (s is None, s))`, which puts a missing session last. No non-lambda form of it is this short.
- **Kept on purpose:**
  - MIND2026 still extracts only the EEG members of its ~74 GB archive, so it does not use `download_and_extract_subject_zip`.
  - Garro2025 and Thapa2025 keep their own extraction step. `download_and_extract_subject_zip` would rename the extension-less Figshare cache file `files/<id>` to `<id>.zip`, which moves `data_dl`'s cache key.
- **LOC added** vs #1200: `moabb/datasets/*.py` 1444 → 1440; `moabb/tests/*.py` (net) 277 → 275.
- **Behaviour:**
  - The class fingerprint (metadata/summary/DOI) is identical.
  - The loader fingerprint is identical apart from one recorded download call. It covers Thapa events and sessions, the MIND event-stream guards, MOVING, and Garro runs, plus new Garro `data_path` scenarios for force, already extracted, and cached-zip-but-not-extracted.
  - In the cached-zip scenario, the subject archive now goes through `data_dl`, which returns the cached file without downloading. The returned paths and the files on disk are identical.
- **Coverage** (pass 3 → pass 4): garro2025 73→73, mind2026 89→89, moving2024 61→61, thapa2025 74→74.
- **Proof:** the offline suite (PR tests, `test_loader_utils.py`, `test_preprocessing.py`, `test_datasets.py`, `test_metadata.py`, `test_doi_validation.py`) ran 2559 passed and 0 failed. ruff 0.15.20 and `git diff --check` are clean.

### Pass 3: shared helpers, NEMAR skip, new montage names (head `1d0fd2970`)
- Thapa2025's `_read_brainvision` is replaced by `read_raw_brainvision_repaired(..., strict=True)`, with the same errors for a missing entry or sibling. Its repair test moved to #1200.
- The montage calls in Garro, MOVING and Thapa use `resolve_montage_name`.
- **NEMAR:** added to `NEMAR_ID_EXEMPT` (`# no public NEMAR mirror yet; tracked in #1195`): `Garro2025`, `MIND2026`, `MOVING2024`, `Thapa2025`. No ids were invented, `NEMAR_ID_PENDING` is untouched, and `test_all_datasets_have_valid_nemar_id` passes locally.
- **LOC added**, measured against #1200 (i.e. after it merges): `moabb/datasets/*.py` 1487 → **1444** (-3%); `moabb/tests/*.py` (net) 301 → **277** (-8%; includes the NEMAR-exempt lines).
- **Coverage** (pass 2 → pass 3, offline suite + `test_loader_utils.py`): garro2025 72→73, mind2026 89→89, moving2024 61→61, thapa2025 76→74. No touched file dropped by more than 2 pp.
- **Behaviour:** Fingerprints (class metadata/summary/DOI + fake data through the real loaders) identical to pass 2 (the only textual difference is a random temp path).
- **Proof:** offline `pytest <PR tests> test_loader_utils.py test_preprocessing.py test_datasets.py test_metadata.py test_doi_validation.py --cov=moabb/datasets` (isolated MNE home, empty `MNE_DATA`, no downloads; `test_dataset_accept` and `TestData::test_epochs` deselected): 0 failed. Also ruff 0.15.20 and `git diff --check`.

| added LOC vs develop | before | after pass 1 | after pass 2 |
|---|---|---|---|
| `moabb/datasets/*.py` | 1683 | 1683 | **1487** (-12%) |
| `moabb/tests/*.py` (net) | 372 | 347 | **301** (-19%) |

PR tests collected (pass 2): 20 → 20. Coverage of touched dataset files (pass-1 before → now, offline suite): garro2025 71→72, mind2026 88→89, moving2024 61→61, thapa2025 71→76.

### Pass 2 — loaders and tests
- Garro: compact subject file-id table (values unchanged), BIDSPath comprehension, shorter docstring; MOVING: channel list as one `.split()`
- MIND restart guard: one count formatter and one half-order check (same accept/reject set); Thapa `events.tsv` reader collapsed to one parse with a single fail-closed `ValueError`, run counter → dict length
- `test_mind2026_regression.py` and `test_thapa2025_regression.py` merged into `test_large_motor_regression.py`; MIND accepted-run (balanced / sub-04 sidecar restart / sub-19 marker restart) and fail-closed cases table-driven
- Kept on purpose: Thapa `_read_brainvision` stale-header repair (cross-PR dedup with Vagaja2023 #1199 is a follow-up, not done here), MIND restart/half-order fail-closed semantics, one transport mock per download contract.
- Proof: offline `pytest <PR tests> test_datasets.py test_metadata.py test_doi_validation.py --cov=moabb/datasets` (isolated MNE home, no downloads; `test_dataset_accept`/`TestData::test_epochs` deselected); behaviour fingerprint before/after on fake source data (per-run data hash, channels/types, sfreq, annotations, events, montage) and class fingerprint (subjects, sessions, event_id, interval, code, DOI, METADATA hash, summary-CSV row, docstring DOIs) identical except `Dataset summary` rendered once instead of twice; ruff 0.15.20, `git diff --check`.
- Unchanged and expected: `Test_Datasets::test_all_datasets_have_valid_nemar_id[<new classes>]` fails (no `nemar_id`, not in `NEMAR_ID_PENDING`) — NEMAR-ID decision still open.

### Pass 1 — test audit
- `test_mind_transport_flags_and_cached_subject[False/True]` and `test_thapa_transport_and_missing_sessions[False/True]` each collapsed to one sequential test (cached → no transport; force → exact kwargs and re-download).
- `test_target_parser_does_not_match_substrings` folded into the events.tsv test (`target 4`→`Tgt4`, `Tgt10` passthrough at the `_annotations_from_events` boundary); `test_exact_balanced_run_does_not_require_restart_layout` merged with the onset-anchoring test (same validator branch); `test_overfull_run_without_code_1_restart_fails_closed[tsv]` dropped (shared `_validated_mi_events`, TSV parsing covered elsewhere); `interval == [0, 10]` restatement and `preload/verbose` call-shape asserts removed.
- Tests collected 25 → 20; test LOC 372 → 347 (−7%). Coverage: garro2025 71→71%, mind2026 88→88%, moving2024 61→61%, thapa2025 71→71%. Proof: offline `pytest <PR tests> moabb/tests/test_datasets.py moabb/tests/test_metadata.py moabb/tests/test_doi_validation.py --cov=moabb/datasets --cov-report=term-missing -p no:cacheprovider` (isolated MNE home, no downloads; `test_dataset_accept`/`TestData::test_epochs` deselected). Pre-existing on this branch, untouched: `Test_Datasets::test_all_datasets_have_valid_nemar_id[<new classes>]` fails (no `nemar_id`, not in `NEMAR_ID_PENDING`).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1109225ac618`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.