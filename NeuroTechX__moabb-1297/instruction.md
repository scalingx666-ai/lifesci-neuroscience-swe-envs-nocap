# Issue

**Title:** Lee2021Mobile: always read the 50-channel 500 Hz /sourcedata/ copy from OSF

## Description

## Problem

OSF project [r7s9b](https://osf.io/r7s9b/) (Lee2021Mobile_ERP / Lee2021Mobile_SSVEP) stores every BrainVision file twice, under the same file name:

| OSF path | content |
|---|---|
| `/sub-XX/ses-YY/eeg/sub-XX_ses-YY_task-*_eeg.{vhdr,eeg,vmrk}` (BIDS copy) | 73 channels at 100 Hz (48 EEG + 2 EOG + 23 IMU, EEG resampled and merged with the IMU) |
| `/sourcedata/sub-XX/ses-YY/eeg/sub-XX_ses-YY_task-*_eeg.{vhdr,eeg,vmrk}` | 50 channels at 500 Hz (32 scalp EEG, 4 EOG, 14 ear EEG) |

Checked for sub-11 ses-01 ERP from the OSF API file sizes: BIDS `.vhdr` 2325 B + `.eeg` 10.5 MB = 73 ch × 100 Hz × 360 s; `/sourcedata/` `.vhdr` 1576 B + `.eeg` 36 MB = 50 ch × 500 Hz × 360 s.

`create_metainfo_osf` returned only `(filename, url)`, and `Lee2021Mobile._download_from_osf` downloaded every row whose file name starts with `sub-XX` to `sub-XX/ses-YY/eeg/<name>`. The first copy listed wins, because the second one finds the file already there. The folder walk is LIFO, so today `/sourcedata/` (the last root entry) is walked first. That is why all the subjects we loaded on develop came out at 50 ch / 500 Hz (channel inventory on Voyager: ERP 11/24 and SSVEP 14/23 subjects loaded before OSF 403/500/timeouts, all 48 EEG + 2 EOG at 500 Hz). The result still depends on OSF's listing order, though. If the order changes, users get the 100 Hz copy, or a `.vhdr` from one copy next to the `.eeg` of the other. A header-only probe keyed by file name (so the copy was not recorded) also saw 73 ch @ 100 Hz headers for subjects 6, 11 and 13-24, and one 46 ch @ 100 Hz header (sub-21 ses-02 ERP).

`summary_p300.csv` / `summary_ssvep.csv` already say 500 Hz. The class `METADATA` said 100 Hz and 73 EEG channels, which describes the BIDS copy and not what the loader returns.

## Fix

- `moabb.datasets.download.create_metainfo_osf` now also returns a `path` column, each file's full path in the project (`materialized_path`, or else the folder path the walk followed, pagination included). The `filename` and `url` columns are unchanged.
- `Lee2021Mobile._select_osf_files` selects by path:
  - `.vhdr`, `.eeg` and `.vmrk` come from `/sourcedata/sub-XX/` only, whatever the listing order;
  - other subject files come from the `/sourcedata/` copy when there is one, else from the BIDS copy;
  - if a BrainVision file of a recording of the requested task (listed in either copy) is missing from `/sourcedata/`, it raises `FileNotFoundError` naming the files. It does not fall back to the BIDS copy. It also drops the cached listing, so a retry lists OSF again, because OSF page errors are only logged and can leave a partial listing;
  - a listing without `path` raises `ValueError`.
- The local cache layout and file names do not change (`MNE-lee2021mobile-data/sub-XX/ses-YY/eeg/<name>`), so existing caches load as before without listing OSF.
- `force_update=True` is now passed to the download. Before, `download_if_missing` kept existing files even with `force_update=True`. Now it replaces them, which is how a cache filled from the BIDS copy can be repaired.
- `METADATA` (both classes): 500 Hz, `{"eeg": 48, "eog": 2}`, the channels the loader returns (the headers type HEOGL/HEOGR as EOG and VEOGU/VEOGL as EEG). The docstring now explains the two copies.
- `whats_new` Bugs entry.

**Other OSF loaders:** `git grep create_metainfo_osf _download_from_osf` finds only `lee2021_mobile.py`. ErpCore2021, Dreyer2023 and the BCI Competition 2020 loaders use their own OSF ids/URLs. The new column is additive.

## Tests

New `moabb/tests/test_lee2021_mobile_osf.py`, fully offline: a fake OSF v2 API (`requests.get`), with optional pagination and optional missing `materialized_path`. In the fake project's root page, `sourcedata` is listed before `sub-11`, so the LIFO walk puts the BIDS copy first (the order that breaks develop). Downloads are faked by writing the URL into the file.

| | develop + new test file | this branch |
|---|---|---|
| `test_lee2021_mobile_osf.py` | 13 failed, 3 passed | 16 passed |
| + `test_metadata.py`, `test_download.py`, `test_datasets.py -m "not download"` | 2556 tests: 13 failures (all the new ones), 356 skipped | 2556 tests: 0 failures, 356 skipped |

Run on Voyager (Python 3.12, pytest 9.1.1). The 3 tests that pass on develop are the "sourcedata listed first" order (2) and "existing cache used as is". On develop the failures read `'/sub-11/ses-...-ERP_eeg.vhdr' == '/sourcedata/...'`, `['filename', 'url'] == ['filename', 'url', 'path']` and `DID NOT RAISE FileNotFoundError`.

## Real-data check: pending

OSF is in planned maintenance until 2026-10-19 15:00 (Paris), so nothing was downloaded for this PR. After that I will run a real-data check on Voyager: a fresh `MNE_DATA`, provider `upstream`, all ERP and SSVEP subjects. For every `.vhdr`/`.eeg`/`.vmrk`, it checks that the cached size equals the `/sourcedata/` size from the OSF API, and that every loaded run is 50 channels at 500 Hz. I will post the results here.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bfe5a5183a1a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.