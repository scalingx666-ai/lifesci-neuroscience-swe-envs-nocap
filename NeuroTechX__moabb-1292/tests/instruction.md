# Issue

**Title:** Thapa2025: every load failed (data_path returned the .eeg/.vmrk next to each .vhdr)

## Description

`Thapa2025.data_path()` listed the runs with `mne_bids.find_matching_paths(..., suffixes="eeg", datatypes="eeg", ignore_json=True)` and no extension filter, so it also returned each run's `_eeg.eeg` and `_eeg.vmrk`. `read_raw_brainvision` refuses those ("The header file must be given to read the data, not a file with extension '.eeg'"), so every load failed, from the Figshare archive and from NEMAR `nm000324` alike.

Fix: `extensions=".vhdr"`.

Test: `test_thapa_data_path_returns_only_brainvision_headers` builds a run with `.vhdr/.eeg/.vmrk/events.tsv`. On develop `data_path` returns 6 paths for 2 runs; with the fix it returns the 2 headers.

Real data (Voyager, NEMAR v1.0.1, first subject): 2 sessions, 13 runs, 31 EEG channels, 250 Hz.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bcf452b4366b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.