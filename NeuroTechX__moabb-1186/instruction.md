# Issue

**Title:** Add four OpenNeuro motor-imagery datasets (Lee2022, Lioi2020_XP1, Lioi2020_XP2, Iwama2023)

## Description

First of a series of small PRs that bring upstream the motor-imagery loaders written for the deep-ceiling benchmark (plan: ~13 PRs of ≤5 loaders, each batch grouped by host/format). This one holds the four **OpenNeuro** datasets. NEMAR mirrors them under their `ds` ids, so they need no rehosting. **Naming (2026-09-30):** the two Lioi loaders are now `Lioi2020_XP1` (ds002336, formerly `LioiXP1`) and `Lioi2020_XP2` (ds002338, formerly `Lioi2020`), after the XP1/XP2 split named in the Sci Data 2020 paper; the table and notes below keep the earlier names.

| Class | OpenNeuro | Subjects | EEG | Classes | Trials / class / subject |
|---|---|---|---|---|---|
| `Lee2022` | ds004022 | 7 (orthopedic impairment) | 18 ch, 500 Hz | reaching / grasping / lifting / twisting (same right arm) | 30 |
| `LioiXP1` | ds002336 | 10 | 63 ch, 5 kHz (inside MR) | right-hand MI vs rest, 20 s blocks | 40 (30 for sub-1) |
| `Lioi2020` | ds002338 | 17 | 63 ch, 5 kHz (inside MR) | right-hand MI vs rest, 20 s blocks | 40 |
| `Iwama2023` | ds004444 | 30 | 129 ch HD-EEG, 1 kHz | right-hand kinesthetic MI vs rest | 20 per session, up to 16 sessions |

Notes:
- `LioiXP1` and `Lioi2020` are the two experiments (XP1 / XP2) of the Lioi et al. EEG-fMRI neurofeedback study. Only the EEG is exposed. The `motorloc` execution localizer in XP1 is left out to keep the paradigm pure imagery.
- The Lee2022 labels come from the data: each trial's class cue (`S 3`–`S 6`) is carried onto the imagery-onset marker (`S 8`) that follows it.
- Each loader is registered in the same places as every other dataset: `__init__`, `summary_imagery.csv`, `doi_cache.json`, the catalog count in `test_metadata.py`, `api.rst` and `whats_new.rst`.

Checks:
- `pytest moabb/tests/test_metadata.py moabb/tests/test_datasets.py` passes locally.
- Real-data smoke test, subject 1 through `MotorImagery().get_data`:
  Each dataset was downloaded from OpenNeuro by its own loader (SDSC Voyager, `MOABB_DOWNLOAD_PROVIDER=upstream`):

  | Dataset | X (trials, ch, samples @128 Hz) | Trials per class | Sessions / runs | median \|x\| |
  |---|---|---|---|---|
  | Lee2022 | (120, 18, 640) | 30 × 4 | 1 / 3 | 2.3 µV |
  | LioiXP1 | (60, 63, 2560) | 30 rest / 30 right_hand (sub-1 has no MIpre/MIpost) | 1 / 3 NF runs | 31.8 µV |
  | Lioi2020 | (82, 63, 2560) | 42 rest / 40 right_hand | 1 / 5 (MIpre, NF×3, MIpost) | 42.9 µV |
  | Iwama2023 | (640, 129, 768) | 320 / 320 | 16 / 1 | 1.3 µV |

  The Lioi amplitudes are higher because the EEG was recorded inside the MR scanner; the loaders expose it as distributed.
- The smoke test caught a label bug in `Iwama2023`, fixed in f88fb85 with a regression test. The EDF carries its own `Status` trigger channel. Its code 1 marks the rest onsets and also a point ~1 s before each task onset. That channel was read next to the stim channel built from `events.tsv`, so every session gained 20 extra `rest` epochs that overlap the imagery (640 rest vs 320 MI for subject 1). The loader now takes events from `events.tsv` only.

## Simplification (2026-09-29, head `98adb9cc9`)

**Depends on #1200.** Merge #1200 (`mne>=1.13`, shared download/marker helpers, OpenNeuro mirror mixin) first. This branch merges it (`git merge --no-ff`, no rebase).

### Pass 4 (ponytail): reuse existing code, no nested functions (head `188f51826`)
- Merges #1200 at `058ae05e6`, which now requires `mne>=1.13` and keeps only `OpenNeuroMirrorMixin` in `_openneuro_mirror.py`.
- Iwama2023 drops the native trigger channel with `raw.drop_channels(...)` over its `stim`-typed channels, which replaces `drop_native_stim`. It does not use `mne.pick_types`, because that also drops bad channels.
- Lioi2020 and LioiXP1 relabel markers with `raw.annotations.rename(...)`, restricted to the descriptions that are present. This replaces `relabel_annotations`.
- Lioi2020's upstream stub `dataset_description.json` is written by `mne_bids.make_dataset_description`, which replaces `write_dataset_description`.
- Montage names are spelled `colin27_1005`/`colin27_1020` directly.
- The tests serve the synthetic NEMAR HTTP API from a module-level `_nemar_handler`. They inject it with `partial(httpx.Client, transport=...)` instead of a nested `def` and a wrapping `lambda`. Every monkeypatched `lambda` is now a `Mock`.
- **Nested functions/lambdas** added by this PR: 7 → **0**.
- **LOC added** vs #1200: `moabb/datasets/*.py` 1070 → 1079 (the inlined stim-channel and rename comprehensions); `moabb/tests/*.py` (net) 203 → 206.
- **Behaviour:**
  - The class fingerprint (metadata/summary/DOI) is identical.
  - The loader fingerprint (fake EDF/EEGLAB/BrainVision/BIDS data through the real loaders, plus mocked download manifests) is identical except in Lioi2020's upstream `dataset_description.json`, which mne-bids now writes:
    - `BIDSVersion` changes from `1.2.0` to mne-bids' `1.9.0`.
    - The file gains `DatasetType: raw` and `GeneratedBy` (MNE-BIDS).
    - `DatasetDOI` gains the `doi:` prefix.
    - mne-bids leaves a `dataset_description.json.lock` next to the file.
  - Name, License and Authors are unchanged, and the file is still only written on the upstream (non-mirror) path.
- **Coverage** (pass 3 → pass 4): iwama2023 42→42, lee2022 43→43, lioi2020 56→56, lioixp1 74→74.
- **Proof:** the offline suite (PR tests, `test_loader_utils.py`, `test_preprocessing.py`, `test_datasets.py`, `test_metadata.py`, `test_doi_validation.py`) passed 2555 tests with 0 failed. ruff 0.15.20 and `git diff --check` are clean.

### Pass 3: shared helpers, NEMAR skip, new montage names (head `524cf6a26`)
- `_openneuro_mirror.py` now comes from #1200 (byte-identical, so it is no longer part of this PR's diff once #1200 merges).
- Montage calls in Lee2022, Lioi2020 and LioiXP1 use `resolve_montage_name("colin27_10xx")`.
- `test_provider_policy` moved to #1200's dataset-agnostic mixin tests. The SDK-transport and no-prefetch contracts still run here through Iwama2023.
- **NEMAR:** none needed (all four classes have OpenNeuro ids). `NEMAR_ID_PENDING` is untouched, and `test_all_datasets_have_valid_nemar_id` passes locally.
- **LOC added**, measured against #1200 (i.e. after it merges): `moabb/datasets/*.py` 1144 → **1070** (-6%); `moabb/tests/*.py` (net) 220 → **203** (-8%; includes the NEMAR-exempt lines).
- **Coverage** (pass 2 → pass 3, offline suite + `test_loader_utils.py`): iwama2023 42→42, lee2022 43→43, lioi2020 56→56, lioixp1 74→74. No touched file dropped by more than 2 pp.
- **Behaviour:** Fingerprints (class metadata/summary/DOI + fake data through the real loaders) identical to pass 2.
- **Proof:** offline `pytest <PR tests> test_loader_utils.py test_preprocessing.py test_datasets.py test_metadata.py test_doi_validation.py --cov=moabb/datasets` (isolated MNE home, empty `MNE_DATA`, no downloads; `test_dataset_accept` and `TestData::test_epochs` deselected): 0 failed. Also ruff 0.15.20 and `git diff --check`.

| added LOC vs develop | before | after pass 1 | after pass 2 |
|---|---|---|---|
| `moabb/datasets/*.py` | 1456 | 1456 | **1144** (-21%) |
| `moabb/tests/*.py` (net) | 179 | 182 | **220** (+23%) |

PR tests collected (pass 2): 8 → 10. Coverage of touched dataset files (pass-1 before → now, offline suite): _openneuro_mirror 94→93, iwama2023 43→42, lee2022 40→43, lioi2020 29→56, lioixp1 38→74.

### Pass 2 — loaders and tests
- `_openneuro_mirror.py`: three repeated blocks → `drop_native_stim`, `relabel_annotations`, `write_dataset_description` (byte-identical copy in #1189, no cross-PR import)
- Lee2022 hand-written summary table removed (metaclass renders it from `summary_imagery.csv`); METADATA-restating prose and one-line module docstrings
- invalid-subject re-checks duplicated by `_mirror_root` removed (6 loaders); single-use helpers and an unreachable `raise` inlined; Iwama staged-subject helpers merged
- LioiXP1 reuses Lioi2020's identical channel/author lists; `_nemar_subject` override → `nemar_subject_template`; Lioi2020 feedback map → set
- Iwama Status-trigger test moved from `test_datasets.py` to the PR's own `test_openneuro_mirror.py`; +1 LioiXP1 loader test and +1 Lioi2020 HTTP-only transport test to keep `_openneuro_mirror` coverage within 2 pp (test LOC therefore +38)
- Kept on purpose: own S3 downloaders of Iwama/Lioi2020 (missing-file semantics), Iwama fail-open montage, Peterson cache-version pipeline.
- Proof: offline `pytest <PR tests> test_datasets.py test_metadata.py test_doi_validation.py --cov=moabb/datasets` (isolated MNE home, no downloads; `test_dataset_accept`/`TestData::test_epochs` deselected); behaviour fingerprint before/after on fake source data (per-run data hash, channels/types, sfreq, annotations, events, montage) and class fingerprint (subjects, sessions, event_id, interval, code, DOI, METADATA hash, summary-CSV row, docstring DOIs) identical except `Dataset summary` rendered once instead of twice; ruff 0.15.20, `git diff --check`.

### Pass 1 — test audit
- `test_openneuro_mirror.py` is the **owner** of the shared `OpenNeuroMirrorMixin` contract (provider policy, SDK raw selection with mocked HTTP transport, no sourcedata prefetch from `get_data`). Those three tests now run once (`MIXIN_CASE` = Iwama2023) instead of being replayed for all four loaders; `test_mirror_flags` stays parametrised because NEMAR ids / subject labels / target dirs are dataset-specific. Tests collected 16 → 7.
- Cross-PR: #1189 carries the same `_openneuro_mirror.py` and keeps only its dataset-specific mirror-flag cases plus one provider-policy case, to be deleted once this PR lands.
- Coverage (offline suite, isolated MNE home, no downloads): `_openneuro_mirror.py` 94→94%, `iwama2023.py` 43→43%, `lee2022.py` 40→40%, `lioi2020.py` 29→29%, `lioixp1.py` 38→38%. Proof: `pytest moabb/tests/test_openneuro_mirror.py moabb/tests/test_datasets.py moabb/tests/test_metadata.py moabb/tests/test_doi_validation.py --cov=moabb/datasets --cov-report=term-missing -p no:cacheprovider` (deselecting `test_dataset_accept`, `TestData::test_epochs`): 2434 → 2425 passed, 0 failed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0d173bf5a745`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.