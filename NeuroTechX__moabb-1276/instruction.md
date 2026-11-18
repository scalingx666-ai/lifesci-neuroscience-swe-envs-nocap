# Issue

**Title:** Fix Kodera2023 mixing 500 Hz and 1000 Hz subjects; add cohort option

## Description

## Problem

`Kodera2023` mixes two recording setups. Reading every BrainVision header of the Zenodo archive gives:

| date folders | subjects (MOABB ids) | channels in the files | `SamplingInterval` |
|---|---|---|---|
| 01_12_2020, 10_12_2020, 14_01_2021, 21_01_2021, 28_01_2021 | 1, 2, 11-15, 18-21, 24-26 (14) | Fp1 F3 F4 C3 C4 P3 P4 F7 F8 T3 T4 T5 T6 Cz Fz Pz + 2 unnamed aux | 2000 µs (500 Hz) |
| 02_09_2021, 23_09_2021, 30_09_2021, 07_10_2021, 14_10_2021, 03_04_2023 | 3-10, 16, 17, 22, 23, 27-29 (15) | Fz Cz Pz F3 F4 P3 P4 C3 C4 | 1000 µs (1000 Hz) |

The loader already keeps the nine shared channels, but not one rate: `METADATA` says 500 Hz while 15 subjects come back at 1000 Hz. The `03_04_2023` short-name recordings are in the 1000 Hz setup, so the docstring's "short names = 500 Hz" split was also wrong.

Per-subject inventory on develop (all 29 subjects loaded with `get_data`, cache off): 1 channel set (9 EEG) and 2 rates (500 Hz: 14 subjects, 1000 Hz: 15 subjects).

`LeftRightImagery().get_data(Kodera2023(), subjects=[1, 3])` on develop:

```
ValueError: all the input array dimensions except for the concatenation axis must match exactly, but along dimension 2, the array at index 0 has size 2001 and the array at index 4 has size 4001
```

and with `return_epochs=True`: `ValueError: epochs[4].info['sfreq'] must match`.

## Fix

This follows the Zhou2020 `cohort` pattern (#1275):

| `cohort` | subjects | channels | rate | code |
|---|---|---|---|---|
| `None` (default) | all 29 | 9 shared (Fz Cz Pz F3 F4 P3 P4 C3 C4) | 500 Hz (1000 Hz runs resampled when loaded) | `Kodera2023` |
| `"16ch"` | the 14 of the 2020-2021 setup | all 16 scalp channels | 500 Hz | `Kodera-16ch2023` |
| `"9ch"` | the 15 of the 2021-2023 setup | 9 | native 1000 Hz | `Kodera-9ch2023` |

- 500 Hz is the default because it is the lowest rate in the archive and the one `METADATA` and the summary table already declare. The 2 auxiliary channels are never returned.
- Subject ids are the same in every option. Asking a cohort for a subject of the other setup raises a `ValueError` in the constructor, in `get_data` (and so in paradigm calls) and in `data_path`. An invalid `cohort` also raises.
- The codes put the tag before the year, so they pass `is_camel_kebab_case`/`is_abbrev`. All options share one download folder.
- `METADATA` of a `cohort` instance describes that variant (subjects, channels, rate). The class `METADATA` (and so the catalog and the summary CSV row) is unchanged.
- A run at any rate other than the archive's two raises instead of being passed through.
- `whats_new` (Bugs) asks users to delete cached `Kodera2023` epochs and results of the 1000 Hz subjects.

## Verification

**Real data** (Voyager, all 29 subjects, cache off):

| tree / option | subjects | channel sets | rates |
|---|---|---|---|
| develop | 29/29 | 1 (9 ch) | 2 (500 Hz: 14, 1000 Hz: 15) |
| this branch, default | 29/29 | 1 (9 ch) | 1 (500 Hz) |
| this branch, `cohort="16ch"` | 14/14 | 1 (16 ch) | 1 (500 Hz) |
| this branch, `cohort="9ch"` | 15/15 | 1 (9 ch) | 1 (1000 Hz) |

Paradigm calls on this branch (`LeftRightImagery`):
- Default, subjects [1, 3]: `X` is (185, 9, 2001), 95 + 90 trials; `return_epochs` gives 9 channels at 500 Hz.
- `cohort="16ch"`, subjects [1, 2]: `X` is (191, 16, 2001).

**Offline tests.** New `moabb/tests/test_kodera2023_cohorts.py` (11 tests) monkeypatches the BrainVision reader and `_prefetch_nemar_sourcedata`, with `MOABB_DOWNLOAD_PROVIDER=upstream`. It covers:
- the setup subject lists;
- the default (shared channels, 500 Hz, cue times kept across resampling, a 10 Hz sine preserved);
- a paradigm call stacking both setups (the crashing call);
- both cohort options with their codes and `METADATA`;
- that cohort instances leave the class `METADATA` untouched;
- out-of-cohort errors, the unexpected-rate error and the shared download folder.

`test_archive_a.py`'s Kodera test now uses a 500 Hz synthetic run.

Local runs: `test_kodera2023_cohorts.py`, `test_archive_a.py`, `test_metadata.py`, `test_doi_validation.py` and `test_datasets.py -m "not download" -k "Kodera or kodera or catalog or metadata or abbrev or kebab or code"` pass. pre-commit is clean.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9eee13699b7b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.