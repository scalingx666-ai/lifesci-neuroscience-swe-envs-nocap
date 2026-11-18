# Issue

**Title:** Add Leelakittisin2025, PerezBlanco2026 and Vagaja2023 archive datasets

## Description

## Scope
Ports **Leelakittisin2025** (was SitStand2026), **PerezBlanco2026**, and **Vagaja2023** onto fresh `origin/develop` (18e7d4c03), with registration, derived acquisition counts, API/catalog documentation, DOI cache and synthetic regressions. The corresponding loaders are byte-identical between `codex/mi58-corrected-20260801` and `bruaristimunha-fork/codex/mi-dataset-expansion` before this port.

- PerezBlanco: wrist **motor execution**, not motor imagery; preserved explicit classification. Correct sample-zero movement onset, missing-state/file errors, verbosity propagation; EDF reader supplies SI units. CSV total is minimum 45 × 320, not the previous per-subject 320.
- SitStand: EEG/EOG microvolt conversion excludes trigger channel, nested archive reuse, duplicate-session rejection, constructor subject/session selection and flags. CSV trials/class is 40 across two sessions (designed count, not an observed released inventory). Explicit warning: the two transition classes differ in starting posture and acquisition block; this is not an uncontaminated imagined-movement contrast.
- Vagaja: keep acquisition-specified BrainVision calibration, class annotations and bad-channel flags; preserve subject-31 stale-header repair; force-update now re-extracts.

## Scientific exclusions / draft blockers
**Vasilyev2021 deliberately deferred.** The existing custom BCI2000 reader assumes SourceChGain is in microvolts, silently defaults missing/malformed gain and offset to identity calibration, truncates incomplete sample blocks, and labels an unknown final auxiliary/reference channel as EEG. The live Figshare v2 description explains states and run metadata but does not resolve physical calibration. Synthetic numbers cannot establish the physical units of released files. No dataset downloads or paper reruns were performed.

Real-file/Voyager validation remains pending for all three included loaders: released class counts, exact trial endpoints, unit agreement with source decoding, archive/header exceptions, and original bad-channel inventory. The synthetic tests verify code contracts, not scientific calibration of the released recordings.

## Transport / NEMAR status
Original transports only:
- PerezBlanco: Figshare article **29666735** (metadata currently version **3**), subject zip IDs resolved via its API; dynamic article resolution is not a pinned file manifest.
- SitStand: Zenodo version record **20348444**, DOI `10.5281/zenodo.20348444`.
- Vagaja: Zenodo version record **8086086**, DOI `10.5281/zenodo.8086086`, GROUPS.zip.

No genuine matching NEMAR/OpenNeuro mirror ID was established by repository-description/search inspection. **No fake IDs, no new exemptions, no placeholder pending deposit and no rehost/publication.** Removed the source's invalid `nemar_id = "EXEMPT"` on SitStand. Missing mirror IDs remain explicit merge blockers and the three NEMAR-ID checks intentionally fail. The inspected similarly named nm000107 is an unrelated wrist sEMG dataset, not this EEG/EMG deposit.

## Local verification (no real-data downloads)
Explicit worktree `PYTHONPATH` with verified `moabb.__file__`, isolated `_MNE_FAKE_HOME_DIR`, existing `MNE_DATA`, `MOABB_DOWNLOAD_PROVIDER=auto`:
- Loader synthetic regressions + metadata + offline DOI suite: **943 passed, 223 skipped, 300 deselected** (live DOI/network cases excluded).
- Bounded dataset suite: **1149 passed, 95 skipped, 330 deselected**, excluding download-marked tests, real `test_epochs`, licence-access test, NEMAR-ID inventory, and initially the selected-session test; the latter was inspected as FakeDataset-only and separately **1 passed**.
- Three included-loader NEMAR-ID checks: **3 failed**, explicitly because no verified mirror IDs exist.
- Touched-file pre-commit: passed after inspecting formatting rewrites. `git diff --check`: passed.

Synthetic cases cover first/last events and epoch retention, known SI values, trigger non-scaling, preserved bad channels, invalid subjects, duplicate/missing sessions, nested archives, forced refresh and propagation of path/update/verbosity flags. Transport is mocked; no anonymous mirror-download claim.

Draft; no merge requested until scientific and mirror gates are resolved.

## Simplification (2026-09-29, head `13bf4d6e5`)

**Depends on #1200.** Merge #1200 (`mne>=1.13`, shared download/marker helpers, OpenNeuro mirror mixin) first. This branch merges it (`git merge --no-ff`, no rebase).

### Pass 4 (ponytail): reuse existing code, no nested functions (head `000b62b40`)
- Merges #1200 at `058ae05e6`, which now requires `mne>=1.13` and drops the pass-3 helpers that re-implemented existing code.
- PerezBlanco2026 (Figshare file URL) and Vagaja2023 download through develop's `download_and_extract_subject_zip`, behind the same extracted-folder check its ten develop callers use. Archives now extract into `MNE-<code>-data/`, not next to the cached archive. PerezBlanco2026 still finds EDFs already extracted under the old `files/` location without querying Figshare.
- Vagaja2023 reads BrainVision with `mne.io.read_raw_brainvision(..., overrides={"data_fname": ..., "marker_fname": ...})`, which replaces `read_raw_brainvision_repaired(strict=True)`. MNE itself raises `FileNotFoundError` on a missing `.eeg`/`.vmrk`. It still uses `rename_stimulus_codes`.
- SitStand2026's nested `resolve_mat_paths` is now the module-level `_resolve_mat_paths(extract_dir, subject)`. Its own zip handling is unchanged: its test counts `ZipFile.extractall` calls, so it is not switched to `safe_extract_zip`.
- Montage names are spelled `colin27_1005`/`colin27_1020` directly.
- The tests replace every monkeypatched `lambda` with `Mock`. The extract-once test counts calls through `patch.object(ZipFile, "extractall", autospec=True, wraps=...)`.
- **Nested functions/lambdas** added by this PR: 5 (1 nested def, 4 patched lambdas) → **0**.
- **LOC added** vs #1200: `moabb/datasets/*.py` 901 → 900; `moabb/tests/*.py` (net) 194 → 199 (the `overrides` and `_load_run` call assertions).
- **Behaviour:**
  - The class fingerprint (metadata/summary/DOI) is identical.
  - The loader fingerprint is identical. It covers synthetic EDF/MAT/BrainVision runs through the real builders, plus (new this pass) PerezBlanco2026/Vagaja2023 `data_path` through fake archives, with the extraction root dropped.
- **Coverage** (pass 3 → pass 4): perezblanco2026 70→70, sitstand2026 88→88, vagaja2023 98→98.
- **Proof:** the offline suite (PR tests, `test_loader_utils.py`, `test_preprocessing.py`, `test_datasets.py`, `test_metadata.py`, `test_doi_validation.py`) had 2533 passed, 0 failed. ruff 0.15.20 and `git diff --check` are clean.

### Pass 3: shared helpers, NEMAR skip, new montage names (head `613d3df32`)
- PerezBlanco2026 and Vagaja2023 extract through `download_and_extract_zip`.
- Vagaja2023's `_read_brainvision` and `S  7` loop are replaced by `read_raw_brainvision_repaired(..., strict=True)` and `rename_stimulus_codes`. The repair test moved to #1200.
- One Vagaja failure-path test was added (missing subject directory, missing MI run).
- The montage calls use `resolve_montage_name`.
- SitStand2026 keeps its nested-layout extraction.
- **NEMAR:** added to `NEMAR_ID_EXEMPT` (`# no public NEMAR mirror yet; tracked in #1199`): `PerezBlanco2026`, `SitStand2026`, `Vagaja2023`. No ids were invented, `NEMAR_ID_PENDING` is untouched, and `test_all_datasets_have_valid_nemar_id` passes locally.
- **LOC added**, measured against #1200 (i.e. after it merges): `moabb/datasets/*.py` 945 → **901** (-5%); `moabb/tests/*.py` (net) 204 → **194** (-5%; includes the NEMAR-exempt lines).
- **Coverage** (pass 2 → pass 3, offline suite + `test_loader_utils.py`): perezblanco2026 71→70, sitstand2026 88→88, vagaja2023 83→98. No touched file dropped by more than 2 pp.
- **Behaviour:** Fingerprints (class metadata/summary/DOI + fake data through the real loaders) identical to pass 2.
- **Proof:** offline `pytest <PR tests> test_loader_utils.py test_preprocessing.py test_datasets.py test_metadata.py test_doi_validation.py --cov=moabb/datasets` (isolated MNE home, empty `MNE_DATA`, no downloads; `test_dataset_accept` and `TestData::test_epochs` deselected): 0 failed. Also ruff 0.15.20 and `git diff --check`.

| added LOC vs develop | before | after pass 1 | after pass 2 |
|---|---|---|---|
| `moabb/datasets/*.py` | 1198 | 1198 | **945** (-21%) |
| `moabb/tests/*.py` (net) | 226 | 224 | **204** (-10%) |

PR tests collected (pass 2): 11 → 11. Coverage of touched dataset files (pass-1 before → now, offline suite): perezblanco2026 71→71, sitstand2026 83→88, vagaja2023 79→83.

### Pass 2 — loaders and tests
- Vagaja2023 hand-written summary table removed; method Parameters/Returns boilerplate and SitStand trigger-code listing condensed
- compact channel lists; Vagaja subject→group map from two lists; PerezBlanco identity `_TARGET_TO_CODE` removed; empty-dict guards around MNE rename/set_channel_types removed
- three PR test files merged into `test_archive_c_regression.py`
- Kept on purpose: Vagaja `_read_brainvision` stale subject-31 header repair (cross-PR dedup with Thapa2025 #1195 is a follow-up), `raw.ch_names[:60] == EEG_CHANNELS` check.
- Proof: offline `pytest <PR tests> test_datasets.py test_metadata.py test_doi_validation.py --cov=moabb/datasets` (isolated MNE home, no downloads; `test_dataset_accept`/`TestData::test_epochs` deselected); behaviour fingerprint before/after on fake source data (per-run data hash, channels/types, sfreq, annotations, events, montage) and class fingerprint (subjects, sessions, event_id, interval, code, DOI, METADATA hash, summary-CSV row, docstring DOIs) identical except `Dataset summary` rendered once instead of twice; ruff 0.15.20, `git diff --check`.
- Unchanged and expected: `Test_Datasets::test_all_datasets_have_valid_nemar_id[<new classes>]` fails (no `nemar_id`, not in `NEMAR_ID_PENDING`) — NEMAR-ID decision still open.

### Pass 1 — test audit
- Only the `preload/verbose` call-shape asserts inside the stale subject-31 header test's fake reader were removed (−2 LOC). No whole test was deletable: each maps to the retention bar (first/last events + SI units; µV→V on EEG/EOG only with the trigger row not rescaled; marker→class mapping + bads; per-class `data_path` guards; transport manifest + missing/duplicate sessions; documented nested-Zenodo extract-once bug; one transport mock per download contract; stale-header data bug).
- Tests collected 11 → 11; test LOC 226 → 224 (−1%, deliberately far below target). Coverage: perezblanco2026 71→71%, sitstand2026 83→83%, vagaja2023 79→79%. Follow-up: `Vagaja2023._read_brainvision` and `Thapa2025._read_brainvision` (#1195) are near-identical stale-header repair helpers — a shared helper would deduplicate both. Proof: offline `pytest <PR tests> moabb/tests/test_datasets.py moabb/tests/test_metadata.py moabb/tests/test_doi_validation.py --cov=moabb/datasets --cov-report=term-missing -p no:cacheprovider` (isolated MNE home, no downloads; `test_dataset_accept`/`TestData::test_epochs` deselected). Pre-existing on this branch, untouched: `Test_Datasets::test_all_datasets_have_valid_nemar_id[<new classes>]` fails (no `nemar_id`, not in `NEMAR_ID_PENDING`).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `336f6a523510`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.