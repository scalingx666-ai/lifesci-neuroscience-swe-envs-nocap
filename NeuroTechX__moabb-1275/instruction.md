# Issue

**Title:** Zhou2020: shared channel set by default, cohort option for the full S-subject montage

## Description

(#1120), asked for by @bruAristimunha: one option that allows both channel sets.

## The bug on `develop`

Since #1269 the S-subjects (1-12) return 41 EEG channels and the A-subjects (13-20) 26. MOABB paradigms stack every subject of a dataset into one array, so anything that loads one S- and one A-subject stops in `np.concatenate`:

```
>>> MotorImagery(events=["left_hand", "right_hand"], n_classes=2).get_data(Zhou2020(), subjects=[1, 13])
  File "moabb/paradigms/base.py", line 617, in get_data
    X = np.concatenate(X, axis=0)
ValueError: all the input array dimensions except for the concatenation axis must match exactly, but along dimension 1, the array at index 0 has size 41 and the array at index 2 has size 26
```

`WithinSessionEvaluation` and `CrossSubjectEvaluation` fail the same way, because both load the whole dataset through `paradigm.get_data` first (`evaluations/base.py:_load_data`). Reproduced offline with synthetic NPZ files that have the real column counts (46 / 29) and on real data in a Voyager Job (S01 + S13, Zenodo files, md5-checked):

| on `develop` | S01 | S13 |
|---|---|---|
| raw EEG channels | 41 | 26 |
| `MotorImagery().get_data(Zhou2020(), subjects=[1, 13])` | ValueError (41 vs 26) | |
| `WithinSessionEvaluation` / `CrossSubjectEvaluation` on S01 + S13 | ValueError (41 vs 26) | |

## Design

The same pattern as the `cap` option of the BCI-FIT loader (#1274): one constructor option, one channel set per option, a separate `code` per option.

| `cohort` | subjects | EEG channels | with `return_all_modalities` | `code` |
|---|---|---|---|---|
| `None` (default) | 1-20 | the 26 shared (F3…CP6) | + hEOG, vEOG | `Zhou2020` |
| `"S"` | 1-12 | 41 (26 shared + F5, AF3, AF4, P5-P6, PO3, POz, PO4, Oz, F6) | + hEOG, vEOG, M1, M2 | `Zhou-s2020` |
| `"A"` | 13-20 | 26 | + hEOG, vEOG | `Zhou-a2020` |

- **Default = shared set.** It is the only channel set that covers all 20 subjects, so `Zhou2020()` works in every paradigm/evaluation again. With `return_all_modalities` the default adds the EOG pair but not the mastoids, which the A-subject files lack.
- **Subject numbers stay 1-20** in every option. Asking a cohort for a subject of the other one raises a `ValueError` that names the cohorts, in the constructor (`subjects=`), in `get_data` and in `data_path`:
  `Zhou2020(cohort='A') holds subjects 13-20 only; subject(s) [1] are not in this cohort. Use cohort=None for all 20 subjects on the 26 shared channels, or cohort='S' (subjects 1-12, 41 EEG channels) / cohort='A' (subjects 13-20, 26 EEG channels).`
- **Codes.** `Zhou2020-S` was the first idea, but `is_abbrev("Zhou2020", code)` lets only lower-case letters, digits and dashes follow a *letter* of the class name and nothing follow its final digits, so the tag goes before the year: `Zhou-s2020`, `Zhou-a2020` (both pass `is_camel_kebab_case` and `is_abbrev`, so no warning on instantiation). Caches and results of the three options never mix; the download folder stays `MNE-zhou2020-data` for all of them (`_SIGN`), so nothing is fetched twice.
- **METADATA.** The class-level `METADATA` (what the catalog, `summary_imagery.csv` and the metadata tests read) now describes the default: 20 subjects, `channel_types={"eeg": 26, "eog": 2}`, 26 `sensors` — this matches the existing `summary_imagery.csv` row (`Zhou2020,20,26,…`). A `cohort` instance carries its own `METADATA` (and `dataset.metadata` returns it): 12 subjects / `{"eeg": 41, "eog": 2, "misc": 2}` / 41 sensors / 20160 trials for `"S"`, 8 subjects / `{"eeg": 26, "eog": 2}` / 13440 trials for `"A"`. Sex/age figures cover all 20 subjects, so only the default carries them.
- Docstring: new "Cohorts and channel sets" section and a Parameters section.

## Tests

`moabb/tests/test_zhou2020_channels.py` (offline: synthetic NPZ, `data_path` and `_prefetch_nemar_sourcedata` monkeypatched, provider `upstream`), 12 tests:
- S layout under `cohort="S"` (column tracing, EOG, mastoids, montage); A layout under `None` and `"A"`;
- default: S01 returns the 26 shared channels, S01 and S13 have identical channel names/types with and without `return_all_modalities`;
- `MotorImagery().get_data` over mixed S+A selections with the default returns one array with the 26 shared channels (the exact call that crashes on `develop`), and 41 / 26 channels for `"S"` / `"A"`;
- codes, subject lists and per-option METADATA (n_subjects, channel_types, sensors, n_trials), class METADATA untouched by a cohort instance;
- out-of-cohort subjects raise in the constructor, `get_data`, paradigm `get_data` and `data_path`; invalid `cohort` raises;
- all options share the download folder.

Local: `test_zhou2020_channels.py` 12 passed; `test_metadata.py`, `test_doi_validation.py` and the Zhou/metadata/code subset of `test_datasets.py` pass. Voyager Job, `-m "not download"`: `test_zhou2020_channels.py`, `test_metadata.py`, `test_doi_validation.py`, `test_datasets.py` pass on this branch except `test_download_prefers_nemar` / `test_download_falls_back_from_nemar`, which fail identically on `develop` in that Job because its environment pins `MOABB_DOWNLOAD_PROVIDER=upstream`; both pass locally without that variable.

Real data (Voyager Job, S01 + S13, same files, this branch):
- default: S01 and S13 return identical channel lists (26 EEG; 26 EEG + hEOG/vEOG with `return_all_modalities`), finite `colin27_1005` positions, 7 sessions each;
- `MotorImagery(left/right).get_data(Zhou2020(), subjects=[1, 13])`: `X` (1659, 26, 2501), 859 + 800 trials, 830/829 per class, median |X| 1.8 µV;
- `WithinSessionEvaluation` (CSP+LDA) on S01 + S13 runs end to end: 14 rows, mean score 0.60 (S01) / 0.57 (S13); `CrossSubjectEvaluation`: 0.53 / 0.58;
- `cohort="S"`: S01 has 41 EEG + 2 EOG + 2 misc, paradigm `X` (859, 41, 2501), within-session 0.63; `cohort="A"`: S13 has 26 EEG + 2 EOG, `X` (800, 26, 2501);
- `Zhou2020(cohort="S").get_data([13])` raises the ValueError above.

Cached Zhou2020 epochs of S-subjects made with the 41-channel layout must be deleted and recomputed (stated in `whats_new`).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `82244606f5f4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.