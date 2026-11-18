# Issue

**Title:** Add CNBI offline MI datasets: Perdikis2018 and Alawieh2025

## Description

## Summary

Adds **Perdikis2018** and **Alawieh2025** (was SpinalStim2025) offline calibration subsets, branched from develop `18e7d4c03`. Registers API docs, metadata/catalog count, imagery summary and all three cited DOI cache entries. **Draft: not merge-ready.**

## Scientific reconciliation

Compared corrected source `f7fe4b041a25bf24ad5d76e0dcdeaf1f1f6f12f0` against expansion `4e7771cd99a4335e29eb6c8975bb546c01d00e2f`, file by file for all four batch candidates; not a wholesale branch transplant.

- Perdikis: retain cue-based offline selection, exclude exploratory single-limb/tongue tasks and incomplete/corrupted folders; EEG numeric microvolts converted to volts. Retain both-feet/both-hands/rest data-borne labels and [1,5] cue-relative window. Metadata now says offline, without a fabricated train/test split.
- SpinalStim: take corrected exact subject-level offline-root resolution (nested d3 folders can contain another participant's token); deduplicate paths, retain cohort channel ordering, exclude d2 repeat participants and online runs. Combine corrected EEG scaling with expansion's auxiliary electrical-channel scaling so EOG is also SI volts. Missing roots/files fail explicitly. Safe ZIP extraction and refresh flags covered.
- Do not transplant paper-branch cache-transformer subclasses: these classes are new upstream, with no upstream legacy cache to migrate. Source-branch legacy caches should not be reused for this verification.
- Both loaders preserve bad-channel flags; no interpolation/clearing. Multiple recording dates are pooled as runs in one synthetic session, explicitly not an across-day session benchmark.
- Summary trial/run totals left unknown rather than copying misleading per-run/designed counts as per-subject totals. Full retained inventory remains a real-data gate.

### Deferred, not included

- **HYGRIP2020**: both implementations explicitly describe actual 25–50% MVC force-sensor contractions (10 contraction/relaxation cycles, 21 s), yet expose `paradigm="imagery"`. Paper DOI https://doi.org/10.3389/fnins.2020.00919. This is execution, not verified MI; needs an explicit motor-execution policy, not silent inclusion in this MI batch. Source branches also disagree on respecting the erroneous `milivolts` HDF5 attribute versus the companion EegPipe volts convention. No unverified unit rewrite imported.
- **Sun2026**: defer conflicting physical-unit provenance. Both branches multiply an already decoded BrainVision/BIDS stream by 1e-6, but corrected branch says header microvolts/current reader omits SI conversion whereas expansion says float payload was written as volts and channels.tsv says V. MNE BrainVision normally already converts header microvolts. A raw binary/header/channels.tsv-to-reader calibration comparison on Voyager is needed to establish whether this is an additional valid conversion or double scaling, including auxiliaries. The loader also silently treats a remote discovery request failure after a run as end-of-session, so completeness needs testing. Candidate public source ds007221 snapshot 1.0.0 / https://doi.org/10.18112/openneuro.ds007221.v1.0.0 is not sufficient evidence of corrected physical calibration. No fabricated NEMAR mirror ID.

## Local verification (no dataset downloads)

Explicit `PYTHONPATH` verified imports from this worktree using the existing mi-batch-1 environment; isolated `_MNE_FAKE_HOME_DIR`, existing `MNE_DATA`, `MOABB_DOWNLOAD_PROVIDER=auto`.

- Synthetic loader tests + metadata + offline DOI checks: **945 passed, 217 skipped, 298 deselected**.
- Bounded dataset suite: **1138 passed, 98 skipped, 329 deselected**.
- Synthetic checks include exact participant roots/no cross-participant duplicate, missing root/channel errors, invalid subjects, first/last annotation samples, first/last Perdikis epochs, SI units including EOG, bad-channel flags, download flags and force-refresh of actual tiny TAR/ZIP fixtures (mock only transport).
- Touched-file pre-commit passes after reviewing formatting rewrites; diff whitespace check passes.
- Exclusions: live DOI `network` checks, `download`-marked tests, `TestData::test_epochs`, license-access `test_dataset_accept`, two selected-session tests whose inherited prefetch can reach real data, and global NEMAR ID gate (run separately below). No paper experiments or real-data computation on laptop; no new real-data verification claimed.

## Explicit draft / merge blockers

- Separate new-class NEMAR gate: **2 failures**, `Perdikis2018 has no NEMAR dataset ID` and `SpinalStim2025 has no NEMAR dataset ID`. No invented IDs, exemptions, or fake pending assignments. Genuine assigned IDs/version and anonymous public retrieval evidence are required; this PR does not rehost/publish anything.
- Voyager source-versus-loader validation: subject/session inventory, true retained per-class counts, full windows, GDF physical calibration and auxiliary scale, and channel policy across cohorts.
- New PR exact-head CI must be inspected separately; local gates are not an all-green CI claim.

## Simplification (2026-09-29, head `563435784`)

**Depends on #1200.** Merge #1200 (`mne>=1.13`, shared download/marker helpers, OpenNeuro mirror mixin) first. This branch merges it (`git merge --no-ff`, no rebase).

### Pass 4 (ponytail): reuse existing code, no nested functions (head `a717e7abd`)
- Merges #1200 at `058ae05e6`, which now requires `mne>=1.13` and drops the pass-3 helpers that re-implemented existing code.
- SpinalStim2025 downloads each cohort archive through develop's `download_and_extract_subject_zip`, behind the same extracted-folder check (`<cohort root>`) its ten develop callers use. Archives now extract into `MNE-spinalstim2025-data/`, not next to the cached archive.
- Perdikis2018 keeps its `.tar.gz` download and `safe_extract_tar`, because develop has no tar counterpart of `download_and_extract_subject_zip`.
- Montage names are spelled `colin27_1005` directly.
- The tests replace the nested `data_dl` fake and every monkeypatched `lambda` with `Mock`.
- **Nested functions/lambdas** added by this PR: 8 → **2**. The two left are the `apply_function(lambda data: data * SCALE)` unit conversions in Perdikis2018 and SpinalStim2025. `np.multiply` cannot take the scale as a keyword, and writing `raw._data` would use private API.
- **LOC added** vs #1200: `moabb/datasets/*.py` 544 → 551 (the explicit extraction check); `moabb/tests/*.py` (net) 159 → 160.
- **Behaviour:**
  - The class fingerprint (metadata/summary/DOI) is identical.
  - The loader fingerprint (synthetic GDF trees and real archives through the real loaders) is identical apart from the recorded `data_dl` calls. SpinalStim2025 no longer looks up an archive that is already extracted (5 calls → 0), and the forced download now passes `fname=None` explicitly.
- **Coverage** (pass 3 → pass 4): perdikis2018 85→85, spinalstim2025 94→94.
- **Proof:** the offline suite (PR tests, `test_loader_utils.py`, `test_preprocessing.py`, `test_datasets.py`, `test_metadata.py`, `test_doi_validation.py`) had 2520 passed and 0 failed. ruff 0.15.20 and `git diff --check` are clean.

### Pass 3: shared helpers, NEMAR skip, new montage names (head `ee3b6de21`)
- SpinalStim2025 extracts through `download_and_extract_zip`.
- The montage calls in Perdikis2018 and SpinalStim2025 use `resolve_montage_name`.
- **NEMAR:** added to `NEMAR_ID_EXEMPT` (`# no public NEMAR mirror yet; tracked in #1191`): `Perdikis2018`, `SpinalStim2025`. No ids were invented, `NEMAR_ID_PENDING` is untouched, and `test_all_datasets_have_valid_nemar_id` passes locally.
- **LOC added**, measured against #1200 (i.e. after it merges): `moabb/datasets/*.py` 556 → **544** (-2%); `moabb/tests/*.py` (net) 156 → **159** (+2%; includes the NEMAR-exempt lines).
- **Coverage** (pass 2 → pass 3, offline suite + `test_loader_utils.py`): perdikis2018 85→85, spinalstim2025 95→94. No touched file dropped by more than 2 pp.
- **Behaviour:** Fingerprints (class metadata/summary/DOI + fake data through the real loaders) identical to pass 2, except the recorded `data_dl` call now has positional `path, force_update, verbose` (same values).
- **Proof:** offline `pytest <PR tests> test_loader_utils.py test_preprocessing.py test_datasets.py test_metadata.py test_doi_validation.py --cov=moabb/datasets` (isolated MNE home, empty `MNE_DATA`, no downloads; `test_dataset_accept` and `TestData::test_epochs` deselected): 0 failed. Also ruff 0.15.20 and `git diff --check`.

| added LOC vs develop | before | after pass 1 | after pass 2 |
|---|---|---|---|
| `moabb/datasets/*.py` | 753 | 753 | **556** (-26%) |
| `moabb/tests/*.py` (net) | 237 | 156 | **156** (-34%) |

PR tests collected (pass 2): 10 → 10. Coverage of touched dataset files (pass-1 before → now, offline suite): perdikis2018 78→85, spinalstim2025 90→95.

### Pass 2 — loaders and tests
- 2 hand-written summary tables removed; channel lists as `.split()`; SpinalStim subject map as one literal (checked equal)
- cue-relabel loop copied in both loaders → one `_keep_class_cues` helper inside this PR
- empty-list guards around MNE calls removed (verified no-ops on MNE 1.13.2); shorter docstrings
- Kept on purpose: lazy per-run loading, warning-suppression scopes, O2/OZ reorder fix, all 10 tests.
- Proof: offline `pytest <PR tests> test_datasets.py test_metadata.py test_doi_validation.py --cov=moabb/datasets` (isolated MNE home, no downloads; `test_dataset_accept`/`TestData::test_epochs` deselected); behaviour fingerprint before/after on fake source data (per-run data hash, channels/types, sfreq, annotations, events, montage) and class fingerprint (subjects, sessions, event_id, interval, code, DOI, METADATA hash, summary-CSV row, docstring DOIs) identical except `Dataset summary` rendered once instead of twice; ruff 0.15.20, `git diff --check`.
- Unchanged and expected: `Test_Datasets::test_all_datasets_have_valid_nemar_id[<new classes>]` fails (no `nemar_id`, not in `NEMAR_ID_PENDING`) — NEMAR-ID decision still open.

### Pass 1 — test audit
- `test_perdikis2018_regression.py` and `test_spinalstim2025_regression.py` (third and second copies of the 16-channel GDF fixture) folded into `test_cnbi_offline.py`: the Perdikis units/first-last test now also feeds `trigger:1` + a `783` cue and asserts `_EEG_CHANNELS` renaming and `both_feet/both_hands/rest` labels; the documented d3/d4 O2/OZ swap is now the *input* of the SpinalStim units/bads/first-last test (asserts restored order); the missing-EEG-channel error test moved unchanged.
- `test_download_flags[2]` removed as a duplicate of the force-update archive test (same transport stub, real tar/zip extraction); that test gained a plain follow-up call proving the cached archive is not re-extracted.
- Tests collected 14 → 10; test LOC 237 → 156 (−34%, every item a verbatim duplicate or copied fixture). Coverage: perdikis2018 78→77% (only the empty-drop branch of `_read_calibration_run`), spinalstim2025 90→90%. Proof: offline `pytest <PR tests> moabb/tests/test_datasets.py moabb/tests/test_metadata.py moabb/tests/test_doi_validation.py --cov=moabb/datasets --cov-report=term-missing -p no:cacheprovider` (isolated MNE home, no downloads; `test_dataset_accept`/`TestData::test_epochs` deselected). Pre-existing on this branch, untouched: `Test_Datasets::test_all_datasets_have_valid_nemar_id[<new classes>]` fails (no `nemar_id`, not in `NEMAR_ID_PENDING`).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1fe3c74add34`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.