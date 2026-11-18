# Issue

**Title:** Add WRCC2023 and MIMED2024 motor imagery datasets

## Description

## Scope
Adds four registered loaders: WRCC2023_MI_A, WRCC2023_MI_B, WRCC2023_MI_C, and MIMED2024 (was Wirawan2024). Includes metadata, summary rows, API entries, cached DOIs and synthetic regression tests. Based on develop `18e7d4c03`.

**Draft: not scientifically or NEMAR merge-ready. No real dataset downloads or experiments were run for this port.**

## Reconciliation, not a blind branch copy
Compared `codex/mi58-corrected-20260801` (`f7fe4b041a25bf24ad5d76e0dcdeaf1f1f6f12f0`) with the freshly checked fork expansion head `4e7771cd99a4335e29eb6c8975bb546c01d00e2f`.
- WRCC-A: retain the corrected volts-at-source interpretation, not the expansion docstring's contradictory millivolt claim. Drop the paper-branch custom cache transformer: this is a new upstream loader and there is no upstream legacy cache to migrate.
- WRCC A/B/C: remove synthetic leading/trailing zero padding and the erroneous inclusive 4-second endpoint. Each 4000-sample stored trial is its own run; the endpoint is 3.999 seconds. Sample-zero annotation events retain first/last trials, while filtering never crosses a stored-trial join. Strict shape, sampling-rate and label validation; no fractional-label truncation.
- Wirawan2024: both source files were identical, but their concatenation and single-session representation were not retained. The primary paper identifies four scenario recording blocks across two days. Expose two day sessions, six independent runs each, one four-second post-baseline analysis window per block (four per class per subject); do not invent within-block cue sequences or six-class up/down labels. Forward download flags and reject missing/duplicate blocks.
- Acquisition channel counts derive from channel_types; no removed n_channels constructor arguments.
- Correct inherited MIMED DOI title/author cache entries using Crossref and DOI content negotiation.

## Explicit deferred candidate
**InMID2024 is not included.** The expansion version synthesizes repeated 5-second cues at onset+3 seconds using the *different MIMED study*; the corrected branch instead labels segment onset, including potential baseline. Both mix motor execution and motor imagery as sessions under paradigm=imagery. Neither resolves InMID-specific cue provenance, and neither is safe to present as validated MI trials. Source DOI: https://doi.org/10.17632/rjx76wd5v6.2. Requires an imagery-only contract plus its own protocol/onset evidence before porting.

## Public metadata evidence and remaining scientific gates
- Anonymous Harvard Dataverse metadata API inspection confirms all three WRCC deposits are version 1.0 and every subject/file ID used here (9/9/8 files). No signal files downloaded. DOIs: 10.7910/DVN/J9JFES, 10.7910/DVN/HFNWRX, 10.7910/DVN/G8FBHH.
- The sparse WRCC public description does **not** independently document physical calibration, channel order, numeric label mapping, or MI-B's inferred 1000 Hz. These remain explicit source/depositor or Voyager verification gates. The source-loader assumptions are retained visibly, not asserted to have been established by the metadata API or synthetic tests.
- MIMED primary protocol: https://pmc.ncbi.nlm.nih.gov/articles/PMC11388714/ (10.1016/j.dib.2024.110833); original versioned data DOI 10.17632/zs25xxjkm9.3. Real-file shape, units, sessions and source-byte provenance remain to be checked on Voyager.
- Channel policy: retain every released EEG channel, no interpolation or clearing of bad-channel flags. No direct-BIDS conversion or new provider contract.

## Local verification
Isolated worktree venv; confirmed moabb.__file__ points here. `_MNE_FAKE_HOME_DIR` and existing `MNE_DATA` isolated; `MOABB_DOWNLOAD_PROVIDER=auto`.
- Bounded combined loader/metadata/DOI/datasets gate: **2109 passed, 326 skipped, 633 deselected**.
- Excluded network/download markers, real-data `test_epochs`, licence `test_dataset_accept`, and the global NEMAR-ID gate (measured separately below). No real-data coverage claim.
- Synthetic checks: first/last stored trials, exact volt preservation, 4000-sample inclusive windows, independent filtering, bad-channel preservation, label validation, day/run mapping, missing/duplicate blocks and transport flag forwarding.
- Touched-file pre-commit clean after reviewing formatting rewrites.

## NEMAR merge blockers — deliberately not hidden
Separate NEMAR-ID selection yields **four expected failures**, one for each added class. No genuine public NEMAR ID/version was established. No invented IDs, no exemptions, no pending-ID registry entries without actual assigned IDs. No rehosting/publication performed. Required: real assigned IDs, verified version and anonymously retrievable source files, followed by Voyager source-vs-loader validation. Full suite/CI must not be described as green while these gates remain.

## Simplification (2026-09-29, head `3076755f2`)

**Depends on #1200.** Merge #1200 (`mne>=1.13`, shared download/marker helpers, OpenNeuro mirror mixin) first. This branch merges it (`git merge --no-ff`, no rebase).

### Pass 4 (ponytail): reuse existing code, no nested functions (head `718a678d7`)
- Merges #1200 at `058ae05e6`, which now requires `mne>=1.13` and drops the pass-3 helpers that re-implemented existing code.
- Wirawan2024 downloads through develop's `download_and_extract_subject_zip`, behind the same extracted-folder check (`Motor Imagery/`) its ten develop callers use.
  - It keeps its one warned re-download of a corrupted archive (`redownload_corrupted=True`).
  - The Mendeley URL ends in `file_downloaded` with no suffix, so the develop function renames the download to `.zip` before extracting.
  - The archive now extracts into `MNE-wirawan2024-data/`, not next to the cached archive.
- Montage names are spelled `colin27_1005`/`colin27_1020` directly.
- The tests replace every monkeypatched `lambda` with `Mock`. The Wirawan2024 transport test now also checks the extracted file under `MNE-wirawan2024-data/`.
- **Nested functions/lambdas** added by this PR: 5 → **0**.
- **LOC added** vs #1200: `moabb/datasets/*.py` 608 → 612 (the explicit extraction check); `moabb/tests/*.py` (net) 129 → 135.
- **Behaviour:**
  - The class fingerprint (metadata/summary/DOI) is identical.
  - The text loader fingerprint (synthetic WRCC/MIMED `.mat` files through the real readers) is identical.
- **Coverage** (pass 3 → pass 4): wirawan2024 87→87, wrcc2023 97→97.
- **Proof:** the offline suite (PR tests, `test_loader_utils.py`, `test_preprocessing.py`, `test_datasets.py`, `test_metadata.py`, `test_doi_validation.py`) had 2540 passed and 0 failed. ruff 0.15.20 and `git diff --check` are clean.

### Pass 3: shared helpers, NEMAR skip, new montage names (head `9da3a4025`)
- Wirawan2024's `_extract_root` is replaced by `download_and_extract_zip(..., redownload_corrupted=True)`. Corrupted-zip recovery was re-probed offline.
- The montage calls in Wirawan and WRCC use `resolve_montage_name`.
- **NEMAR:** added to `NEMAR_ID_EXEMPT` (`# no public NEMAR mirror yet; tracked in #1196`): `WRCC2023_MI_A`, `WRCC2023_MI_B`, `WRCC2023_MI_C`, `Wirawan2024`. No ids were invented, `NEMAR_ID_PENDING` is untouched, and `test_all_datasets_have_valid_nemar_id` passes locally.
- **LOC added**, measured against #1200 (i.e. after it merges): `moabb/datasets/*.py` 626 → **608** (-3%); `moabb/tests/*.py` (net) 125 → **129** (+3%; includes the NEMAR-exempt lines).
- **Coverage** (pass 2 → pass 3, offline suite + `test_loader_utils.py`): wirawan2024 82→87, wrcc2023 97→97. No touched file dropped by more than 2 pp.
- **Behaviour:** Fingerprints (class metadata/summary/DOI + fake data through the real loaders) identical to pass 2.
- **Proof:** offline `pytest <PR tests> test_loader_utils.py test_preprocessing.py test_datasets.py test_metadata.py test_doi_validation.py --cov=moabb/datasets` (isolated MNE home, empty `MNE_DATA`, no downloads; `test_dataset_accept` and `TestData::test_epochs` deselected): 0 failed. Also ruff 0.15.20 and `git diff --check`.

| added LOC vs develop | before | after pass 1 | after pass 2 |
|---|---|---|---|
| `moabb/datasets/*.py` | 1141 | 1141 | **626** (-45%) |
| `moabb/tests/*.py` (net) | 118 | 114 | **125** (+6%) |

PR tests collected (pass 2): 15 → 11. Coverage of touched dataset files (pass-1 before → now, offline suite): wirawan2024 83→82; wrcc2023_mi_a/b/c 87/89/89 → wrcc2023 97 (one module).

### Pass 2 — loaders and tests
- WRCC2023_MI_A/B/C: three modules with copy-pasted `data_path`/`_get_single_subject_data`/`_mat_to_raw` → one `wrcc2023.py` with a shared `_WRCC2023` loader; trials built as runs directly (no concat-then-split); dead branches (list path, ndim==2 reshape, duplicate channel-count check) removed
- hand-written summary tables removed (rendered twice); Wirawan2024 compact channel list, unused constant, shorter docstrings
- tests: one fake-file helper; stored-window test on MI-A (stores `fs`) and MI-B (no `fs`); invalid-source table incl. the `fs != 1000` check; transport test asserts the per-class file id
- Kept on purpose: public class names, codes, file ids, events and intervals unchanged; Wirawan corrupted-zip retry and MIMED shape checks.
- Proof: offline `pytest <PR tests> test_datasets.py test_metadata.py test_doi_validation.py --cov=moabb/datasets` (isolated MNE home, no downloads; `test_dataset_accept`/`TestData::test_epochs` deselected); behaviour fingerprint before/after on fake source data (per-run data hash, channels/types, sfreq, annotations, events, montage) and class fingerprint (subjects, sessions, event_id, interval, code, DOI, METADATA hash, summary-CSV row, docstring DOIs) identical except `Dataset summary` rendered once instead of twice; ruff 0.15.20, `git diff --check`.
- Unchanged and expected: `Test_Datasets::test_all_datasets_have_valid_nemar_id[<new classes>]` fails (no `nemar_id`, not in `NEMAR_ID_PENDING`) — NEMAR-ID decision still open.

### Pass 1 — test audit
- `test_invalid_trial_labels_fail`: label cases `[[1],[1,4],[1,2,3],[1,2.5]]` → `[[1],[1,4]]` (one per branch of the validation condition); per-class parametrisation kept because `_mat_to_raw` is a separate copy in A/B/C. Removed the 3-line filter self-comparison inside the stored-windows test (`n_times` + exact `get_data()` equality already prove run independence).
- Tests collected 21 → 15; test LOC 118 → 114 (−3%; the redundancy was parametrisation, not lines). Coverage: wirawan2024 83→83%, wrcc2023_mi_a 87→87%, wrcc2023_mi_b 89→89%, wrcc2023_mi_c 89→89%. Follow-up: `_mat_to_raw` is triplicated with drift across A/B/C — a shared helper would let one test cover all three. Proof: offline `pytest <PR tests> moabb/tests/test_datasets.py moabb/tests/test_metadata.py moabb/tests/test_doi_validation.py --cov=moabb/datasets --cov-report=term-missing -p no:cacheprovider` (isolated MNE home, no downloads; `test_dataset_accept`/`TestData::test_epochs` deselected). Pre-existing on this branch, untouched: `Test_Datasets::test_all_datasets_have_valid_nemar_id[<new classes>]` fails (no `nemar_id`, not in `NEMAR_ID_PENDING`).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3eba40536da9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.