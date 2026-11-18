# Issue

**Title:** Add Jia2019, MIBMPI2024, Ortiz2023 and Wang2025 motor-imagery datasets

## Description

## Summary
Port four existing MATLAB/EEGLAB motor-imagery loaders from the MI expansion/corrected branches onto current `develop`: **Jia2019, MIBMPI2024 (was Yilmaz2024), Ortiz2023, Wang2025 (was ZjuMI2025)**. This is the planned MAT batch, not a claim all four use Figshare: MIBMPI2024 downloads its Zenodo release and Wang2025 uses Hugging Face. No new dataset was implemented from scratch.

- Register metadata, API docs, imagery summary and cached DOIs.
- Derive channel totals from channel types and forward download path/force/verbosity. `update_path` remains the deprecated compatibility argument.
- Reject mismatched/invalid labels rather than silently truncating; validate shape and stored windows.
- Correct inclusive Yilmaz/ZJU endpoints so final epochs contain no padding/next-trial sample; preserve zero-duration `EDGE boundary` annotations through the common annotation pipeline so filtering does not cross stored epochs.
- Reject absent, incomplete or duplicated Ortiz EXPERIENCE task sessions; retain 27 EEG + 4 EOG. Ortiz counts are unbalanced: 32 relaxation / 16 imagery / 16 counting segments per session, with two subjects having a second session.

## Deliberate exclusion: Patel2025
Compared both source variants. Expansion uses an amplitude-based `1e-9` correction; corrected source explicitly says its `1e-6` is only nominal storage in **undocumented, uncalibrated native units**. Neither establishes physical SI calibration. The corrected source also accepts 256-sample trials for an inclusive `[0,1]` interval requiring 257 samples, so one padding sample still enters the epoch. The old source additionally retains short trials by padding. Patel is **not registered or ported in this PR**: resolve source calibration and valid trial boundaries before upstream scientific use. This finding may affect prior paper-branch results; no reruns are launched here.

## Draft / merge blockers
- **No real-data validation in this work.** Only synthetic/mocked local tests; no laptop dataset downloads, no experiments. Existing source scientific claims (including units, channel ordering, retained inventory and inferred metadata) still require direct source/real-data confirmation on the authorized remote machine.
- **No verified public NEMAR mirrors for these four additions.** No IDs invented, no exemption or pending-deposit registry modified, no rehosting/publication attempted. The existing `test_all_datasets_have_valid_nemar_id` remains intentionally failing for these four until genuine IDs and public mirror evidence are available. This is not merge-ready.
- Summary trial counts are design/source estimates, not a newly verified retained census. Yilmaz ~110/class/subject (both sessions); Ortiz mean 25.6/class/subject (unbalanced); Jia 40/class/subject.

## Local validation
Run with explicit `PYTHONPATH` pointing to this worktree (verified `moabb.__file__`), an isolated fake MNE home, existing temporary MNE_DATA, and `MOABB_DOWNLOAD_PROVIDER=auto`.
- Synthetic first/last epochs, SI scaling according to source assumptions, label/shape errors, download flags, missing/duplicate sessions, session mapping and discontinuity preservation/filter isolation.
- Metadata, offline DOI, preprocessing and explicitly selected offline registration checks.
- Touched-file pre-commit.
- Excluded network DOI resolution and broad dataset suite (contains unmarked real-download paths, including `test_dataset_accept` and `TestData::test_epochs`); no real-data checks represented as passed.

Results: **1083 passed, 221 skipped, 302 deselected** in the bounded offline suite; **15 synthetic batch tests passed**. All applicable touched-file pre-commit hooks passed. Separate NEMAR policy check: **4 expected failures**, one per added dataset. DOI cache entries were preserved from the existing source branch, not newly verified by network resolution.

## Simplification (2026-09-29, head `f1c261b9b`)

**Depends on #1200.** Merge #1200 (`mne>=1.13`, shared download/marker helpers, OpenNeuro mirror mixin) first. This branch merges it (`git merge --no-ff`, no rebase).

### Pass 4 (ponytail): reuse existing code, no nested functions (head `2fd36dea6`)
- Merges #1200 at `058ae05e6`, which now requires `mne>=1.13` and drops the pass-3 helpers that re-implemented existing code.
- Ortiz2023 downloads through develop's `download_and_extract_subject_zip`, behind the same extracted-folder check its ten develop callers use. It keeps its one warned re-download of a corrupted archive (`redownload_corrupted=True`). The Figshare URL has no `.zip` suffix, and the develop function renames the download to `.zip` before extracting. The archive now extracts into `MNE-ortiz2023-data/MI_walking_figshare21185362/`, not next to the cached archive.
- Jia2019, Yilmaz2024 and ZjuMI2025 build their trial-join markers with `mne.Annotations(onsets, 0.0, "EDGE boundary")` directly, replacing `edge_boundary_annotations`.
- Montage names are spelled `colin27_1005`/`colin27_1020` directly.
- The tests replace the nested `data_dl` fake and every monkeypatched `lambda` with `Mock`, and assert on `call_args_list`.
- **Nested functions/lambdas** added by this PR: 8 → **0**.
- **LOC added** vs #1200: `moabb/datasets/*.py` 1030 → 1030; `moabb/tests/*.py` (net) 139 → 140.
- **Behaviour:**
  - The class fingerprint (metadata/summary/DOI) is identical.
  - The loader fingerprint (synthetic `.mat`/`.set` files and a corrupted-then-valid archive through the real loaders) is identical apart from the recorded `data_dl` calls. Ortiz2023 now makes fewer calls, because it no longer looks up an archive that is already extracted (`cached_calls` 1 → 0).
- **Coverage** (pass 3 → pass 4): jia2019 83→82, ortiz2023 86→86, yilmaz2024 92→92, zju_mi2025 97→97.
- **Proof:** the offline suite (PR tests, `test_loader_utils.py`, `test_preprocessing.py`, `test_datasets.py`, `test_metadata.py`, `test_doi_validation.py`) had 2547 passed and 0 failed. ruff 0.15.20 and `git diff --check` are clean.

### Pass 3: shared helpers, NEMAR skip, new montage names (head `da3015ad8`)
- Ortiz2023 now calls `download_and_extract_zip(..., redownload_corrupted=True)`. An offline probe confirmed the same behaviour as before: a corrupt archive warns, is downloaded again with `force_update=True` and extracted, and a second corruption raises.
- Jia2019, Yilmaz2024 and ZjuMI2025 use `edge_boundary_annotations`.
- The `preprocessing.py` EDGE-boundary change is now owned by #1200. Four PRs had each edited it differently.
- The montage calls in Ortiz, Yilmaz and Zju use `resolve_montage_name`.
- **NEMAR:** added to `NEMAR_ID_EXEMPT` (`# no public NEMAR mirror yet; tracked in #1190`): `Jia2019`, `Ortiz2023`, `Yilmaz2024`, `ZjuMI2025`. No ids were invented, `NEMAR_ID_PENDING` is untouched, and `test_all_datasets_have_valid_nemar_id` passes locally.
- **LOC added**, measured against #1200 (i.e. after it merges): `moabb/datasets/*.py` 1038 → **1030** (-1%); `moabb/tests/*.py` (net) 136 → **139** (+2%; includes the NEMAR-exempt lines).
- **Coverage** (pass 2 → pass 3, offline suite + `test_loader_utils.py`): jia2019 82→83, ortiz2023 83→86, yilmaz2024 92→92, zju_mi2025 97→97. No touched file dropped by more than 2 pp.
- **Behaviour:** Fingerprints (class metadata/summary/DOI + fake data through the real loaders) identical to pass 2.
- **Proof:** offline `pytest <PR tests> test_loader_utils.py test_preprocessing.py test_datasets.py test_metadata.py test_doi_validation.py --cov=moabb/datasets` (isolated MNE home, empty `MNE_DATA`, no downloads; `test_dataset_accept` and `TestData::test_epochs` deselected): 0 failed. Also ruff 0.15.20 and `git diff --check`.

| added LOC vs develop | before | after pass 1 | after pass 2 |
|---|---|---|---|
| `moabb/datasets/*.py` | 1385 | 1385 | **1038** (-25%) |
| `moabb/tests/*.py` (net) | 155 | 144 | **136** (-12%) |

PR tests collected (pass 2): 15 → 11. Coverage of touched dataset files (pass-1 before → now, offline suite): jia2019 80→82, ortiz2023 78→83, yilmaz2024 93→92, zju_mi2025 97→97, preprocessing 40→40.

### Pass 2 — loaders and tests
- 4 hand-written summary tables removed; channel/subject lists as `.split()`; Parameters boilerplate in private-method docstrings cut
- unused constants and unreachable branches removed; Jia `_trials` inlined; simpler run detection/trial concatenation in Ortiz and Zju; Ortiz corrupted-zip retry shortened (same warning, same re-download, second corruption still raises)
- 4 invalid-subject tests folded into the matching download-flag tests (assertion kept)
- Kept on purpose: Jia Figshare file ids, Jia's two `set_annotations` calls (MNE ordering at equal onsets), all validation messages, EDGE-boundary test (only functional test of the `preprocessing.py` change).
- Proof: offline `pytest <PR tests> test_datasets.py test_metadata.py test_doi_validation.py --cov=moabb/datasets` (isolated MNE home, no downloads; `test_dataset_accept`/`TestData::test_epochs` deselected); behaviour fingerprint before/after on fake source data (per-run data hash, channels/types, sfreq, annotations, events, montage) and class fingerprint (subjects, sessions, event_id, interval, code, DOI, METADATA hash, summary-CSV row, docstring DOIs) identical except `Dataset summary` rendered once instead of twice; ruff 0.15.20, `git diff --check`.
- Unchanged and expected: `Test_Datasets::test_all_datasets_have_valid_nemar_id[<new classes>]` fails (no `nemar_id`, not in `NEMAR_ID_PENDING`) — NEMAR-ID decision still open.

### Pass 1 — test audit
- `_check_epochs`: removed the band-pass `|x| < 1e-10` probe — all synthetic trials share one constant amplitude, so it passes with or without EDGE boundaries (tautological); the EDGE-boundary count assertion stays as the functional test of the `preprocessing.py` change.
- `test_download_flags`: simplified to a transport stub recording `(path, force_update, verbose)` with one equality assert (module via `sys.modules`).
- Retained on purpose: per-class invalid-subject and transport tests (every class overrides `data_path`), `test_session_mapping` (only proof of file→session/run ordering), units/first-last/missing-duplicate-session tests.
- Tests collected 15 → 15; test LOC 155 → 144 (−7%). Coverage: jia2019 80→80%, ortiz2023 78→78%, yilmaz2024 93→93%, zju_mi2025 97→97%, preprocessing 40→40%. Proof: offline `pytest <PR tests> moabb/tests/test_datasets.py moabb/tests/test_metadata.py moabb/tests/test_doi_validation.py --cov=moabb/datasets --cov-report=term-missing -p no:cacheprovider` (isolated MNE home, no downloads; `test_dataset_accept`/`TestData::test_epochs` deselected). Pre-existing on this branch, untouched: `Test_Datasets::test_all_datasets_have_valid_nemar_id[<new classes>]` fails (no `nemar_id`, not in `NEMAR_ID_PENDING`).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b7e30e0e021a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.