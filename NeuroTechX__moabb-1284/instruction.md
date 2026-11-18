# Issue

**Title:** Fix Chang2025 silently skipping subjects 10, 15, 19, 20, 24 and 25 (wrong ZIP per subject)

## Description

## Problem

I inventoried `Chang2025` on develop: all 28 subjects, `get_data` with the cache off, into an empty data directory. The run finished with no errors, but **6 subjects returned no data**: 10, 15, 19, 20, 24 and 25. Each one only logged a warning:

```
WARNING moabb.datasets.chang2025 Subject directory for S211 not found under .../MNE-chang2025-data. The upstream data may be missing for this subject. Skipping.
```

The cause is the ZIP lookup. MOABB subjects 1-28 map to the original IDs S201-S230 without S207 and S218. The figshare ZIPs are split by **original ID**; I listed the members of the downloaded files on Voyager:

| figshare file | members |
|---|---|
| 57432889 (`01_05`) | S201-S205 |
| 57433693 (`06_10`) | S206, S208-S210 |
| 57435691 (`11_15`) | S211-S215 |
| 57435694 (`15_20`) | S216, S217, S219, S220 |
| 57560707 (`21_25`) | S221-S225 |
| 57560710 (`26_30`) | S226-S230 |

`_ZIP_FILES` chose the ZIP by **MOABB subject number** (`range(1, 6)`, `range(6, 11)`, …). So, for example, subject 10 (S211) fetched `06_10`, did not find `S211/`, and returned `{}`. The six subjects only loaded if the following subject had been loaded first and had extracted their ZIP. On a fresh cache, `Chang2025().get_data([10])` returns nothing, and a paradigm call silently has 22 subjects instead of 28.

## Fix

- `_ZIP_FILES` now lists the original IDs in each ZIP (the table above), and `data_path` looks up the subject's original ID.
- Nothing else changes. The 22 subjects that loaded before return the same data.
- `whats_new` (Bugs) has an entry.

## Verification

**Real data** (Voyager, this branch): I used a fresh data directory that held only the four already-downloaded ZIPs of these subjects, symlinked, with nothing extracted. Subjects **10, 15, 19 and 24** (one for each affected ZIP) all load: 59 EEG + stim at 1000 Hz, the same channel set and rate as the other 22 subjects in the develop inventory.

**Offline tests.** New `moabb/tests/test_chang2025_zips.py` uses synthetic ZIPs with the released member layout and a monkeypatched `dl.data_dl`. It checks:
- the table against the released ZIP membership;
- for each of the 28 subjects, that exactly one ZIP is fetched and that it holds the subject's folder.

On develop, the table test and the subject tests for 10, 15, 19, 20, 24 and 25 fail. All 29 tests pass on this branch, and pre-commit is clean.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9c8723775b7c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.