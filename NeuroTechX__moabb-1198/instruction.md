# Issue

**Title:** feat(datasets): add MartinezPeon2025 hand-grip and MILimbEEG imagery datasets

## Description

## Summary
Port two existing loaders onto current develop: MartinezPeon2025 (was KMIHandGrip2025) and MILimbEEG, including registry, current metadata API, DOI cache, summary and docs.

- KMI keeps the expansion-branch warning that class equals recording block: within-recording evaluation can exploit nonstationarity; prefer cross-subject evaluation. Both metadata and signal downloads forward path/update/verbosity. Reject incomplete 84-second records; inclusive imagery windows contain 2000 actual samples.
- MILimbEEG loads imagery I files only, not executed M files; handles 16 EEG columns with or without sample index; microvolts to volts; rejects incomplete four-second records. Removes synthetic padding, uses inclusive 499/125-second endpoints, and preserves EDGE boundary annotations through event reconstruction/filtering. First and final trials survive without padding.
- CSV counts not verified against all releases are deliberately unspecified rather than copied from misleading source rows. Native flags are not silently cleared or interpolated.

## Reconciliation and scientific deferrals
Compared corrected f7fe4b041a25bf24ad5d76e0dcdeaf1f1f6f12f0 with expansion 4e7771cd99a4335e29eb6c8975bb546c01d00e2f. MILimbEEG identical; KMI differs only by the necessary block-confound warning, retained here.
Deferred Rehab2025OpenBCI: corrected uses S6/4s whereas expansion uses S4/3s justified by ERD rather than an authoritative code-to-task map; expansion also documents three railed channels but loader does not mark them bad. Neither conflicting mapping is certified.
Deferred Medvedeva2026: expansion corrects imagery to execution, consistent with description of actual intact/paretic hand movements. Not an MI candidate.
Deferred Russo2024: source explicitly says ExG-to-anatomical mapping is inferred, not an author wiring table, and scaling is assumed microvolts. Do not silently impose a speculative montage/calibration.

## Validation
Isolated MNE home/data and explicit worktree imports. Offline suite: 2075 passed, 478 skipped, 464 deselected, including 6 focused synthetic SI/window/transport/filtering tests. Touched pre-commit passes. Excluded network-marked cases, real-data test_epochs, test_dataset_accept, inherited-prefetch selected-session test, and separately measured NEMAR policy gate. No real downloads, Voyager jobs or paper reruns.

## Draft blockers — do not merge
NEMAR policy: two expected failures, no confirmed IDs. Read-only discovery inspected descriptions of 787 nemarDatasets repositories; no match established; web search provider unavailable. No invented IDs/versions/exemptions/pending entries, publication or rehosting. Full real-data source calibration, actual counts/repetitions and channel flags remain unvalidated. Full CI is not claimed green. The small EDGE annotation preservation fix also occurs in the parallel Pan/Polo draft and should be reconciled when either lands.

## Simplification (2026-09-29, head `fce51a442`)

**Depends on #1200.** Merge #1200 (`mne>=1.13`, shared download/marker helpers, OpenNeuro mirror mixin) first. This branch merges it (`git merge --no-ff`, no rebase).

### Pass 4 (ponytail): reuse existing code, no nested functions (head `d9eaeba48`)
- Merges #1200 at `058ae05e6`, which now requires `mne>=1.13` and drops the pass-3 helpers that re-implemented existing code.
- MILimbEEG downloads through develop's `download_and_extract_subject_zip`, behind the same extracted-folder check its ten develop callers use. The archive now extracts into `MNE-milimbeeg-data/MILimbEEG/`, not next to the cached archive. Both subject-folder layouts (archive root or one wrapper folder) are still resolved.
- MILimbEEG marks stored-trial joins with `mne.Annotations(onsets, 0.0, "EDGE boundary")`, which replaces `edge_boundary_annotations`. Its header-row check is now `any(isinstance(v, str) for v in frame.iloc[0])`, with no `Series.map(lambda)`.
- Montage names are spelled `colin27_1020` directly (KMIHandGrip2025, MILimbEEG).
- **Nested functions/lambdas** added by this PR: 1 (`lambda-arg`) → **0**.
- **LOC added** vs #1200: `moabb/datasets/*.py` 501 → 492; `moabb/tests/*.py` (net) 112 → 113.
- **Behaviour:**
  - The class fingerprint (metadata/summary/DOI) is identical.
  - The loader fingerprint (synthetic CSV trials in every layout, plus real zips through `data_path`) is identical apart from the recorded `data_dl` calls, which now carry an explicit `fname=None`.
- **Coverage** (pass 3 → pass 4): kmi_handgrip2025 85→85, milimbeeg 87→86.
- **Proof:** the offline suite (PR tests, `test_loader_utils.py`, `test_preprocessing.py`, `test_datasets.py`, `test_metadata.py`, `test_doi_validation.py`) had 2515 passed, 0 failed. ruff 0.15.20 and `git diff --check` are clean.

### Pass 3: shared helpers, NEMAR skip, new montage names (head `1448857b3`)
- MILimbEEG uses `download_and_extract_zip` and `edge_boundary_annotations`.
- The montage calls in KMIHandGrip and MILimbEEG use `resolve_montage_name`.
- The `preprocessing.py` change is now owned by #1200.
- **NEMAR:** added to `NEMAR_ID_EXEMPT` (`# no public NEMAR mirror yet; tracked in #1198`): `KMIHandGrip2025`, `MILimbEEG`. No ids were invented, `NEMAR_ID_PENDING` is untouched, and `test_all_datasets_have_valid_nemar_id` passes locally.
- **LOC added**, measured against #1200 (i.e. after it merges): `moabb/datasets/*.py` 500 → **501** (+0%); `moabb/tests/*.py` (net) 110 → **112** (+2%; includes the NEMAR-exempt lines).
- **Coverage** (pass 2 → pass 3, offline suite + `test_loader_utils.py`): kmi_handgrip2025 85→85, milimbeeg 87→87. No touched file dropped by more than 2 pp.
- **Behaviour:** Fingerprints (class metadata/summary/DOI + fake data through the real loaders) identical to pass 2, except the recorded `data_dl` call now has positional `path, force_update, verbose` (same values).
- **Proof:** offline `pytest <PR tests> test_loader_utils.py test_preprocessing.py test_datasets.py test_metadata.py test_doi_validation.py --cov=moabb/datasets` (isolated MNE home, empty `MNE_DATA`, no downloads; `test_dataset_accept` and `TestData::test_epochs` deselected): 0 failed. Also ruff 0.15.20 and `git diff --check`.

| added LOC vs develop | before | after pass 1 | after pass 2 |
|---|---|---|---|
| `moabb/datasets/*.py` | 657 | 657 | **500** (-24%) |
| `moabb/tests/*.py` (net) | 133 | 127 | **110** (-17%) |

PR tests collected (pass 2): 6 → 6. Coverage of touched dataset files (pass-1 before → now, offline suite): kmi_handgrip2025 78→85, milimbeeg 88→87.

### Pass 2 — loaders and tests
- MILimbEEG: vestigial `pad`/`gap` removed (loader fingerprint proves no effect), `_label_of` → regex, compact channel list
- KMIHandGrip2025: `_file_map` folded into `data_path`, dead list-type checks removed, `_read_run` takes the label directly, shorter docstrings
- tests: shared download-flag dict, stronger path checks, 10-line epoch construction → direct last-trial-fits check
- Kept on purpose: MILimbEEG header-row/transposed-file handling and shape checks.
- Proof: offline `pytest <PR tests> test_datasets.py test_metadata.py test_doi_validation.py --cov=moabb/datasets` (isolated MNE home, no downloads; `test_dataset_accept`/`TestData::test_epochs` deselected); behaviour fingerprint before/after on fake source data (per-run data hash, channels/types, sfreq, annotations, events, montage) and class fingerprint (subjects, sessions, event_id, interval, code, DOI, METADATA hash, summary-CSV row, docstring DOIs) identical except `Dataset summary` rendered once instead of twice; ruff 0.15.20, `git diff --check`.
- Unchanged and expected: `Test_Datasets::test_all_datasets_have_valid_nemar_id[<new classes>]` fails (no `nemar_id`, not in `NEMAR_ID_PENDING`) — NEMAR-ID decision still open.

### Pass 1 — test audit
- `test_milimb_si_and_last_window[True|False]`: filter round-trip replaced by a direct `EDGE boundary` onset assertion (`500/125`). `test_milimb_transport_flags`: tautological `len(...) == 1` strengthened to the exact extracted subject path (now checks zip extraction + folder resolution) at equal LOC.
- Retained on purpose: indexed/unindexed CSV variants (documented 17- vs 16-column files), short-trial rejection, KMI last-trial Epochs shape, record-JSON → 5×`data_dl` manifest mock.
- Tests collected 6 → 6; test LOC 133 → 127 (−5%). Coverage: kmi_handgrip2025 78→78%, milimbeeg 88→88%, preprocessing 40→40%. Follow-up noted (not changed): vestigial `pad = 0`/empty `gap` in `milimbeeg._get_single_subject_data`. Proof: offline `pytest <PR tests> moabb/tests/test_datasets.py moabb/tests/test_metadata.py moabb/tests/test_doi_validation.py --cov=moabb/datasets --cov-report=term-missing -p no:cacheprovider` (isolated MNE home, no downloads; `test_dataset_accept`/`TestData::test_epochs` deselected). Pre-existing on this branch, untouched: `Test_Datasets::test_all_datasets_have_valid_nemar_id[<new classes>]` fails (no `nemar_id`, not in `NEMAR_ID_PENDING`).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d24005858d5e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.