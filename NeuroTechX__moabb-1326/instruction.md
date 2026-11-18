# Issue

**Title:** Fix HefmiIch2025 subjects made of other people's sessions: take subjects and sessions from the depositor's figshare folders

## Description

## What was wrong

`HefmiIch2025` returned subjects made of other people's sessions. The figshare file names carry no subject (`1_epo.mat` x 37, `2_epo.mat` x 36, `3_epo.mat` x 25), and the loader sorted the EEG epoch files by figshare file id (upload order) and started a new subject at every `1_epo.mat`. The upload order is shuffled, so:

- 23 of its 37 subjects mixed sessions of two to four people, and 31 of the 37 people were split over two or three subjects (subjects had up to 6 "sessions" although nobody has more than 3);
- only one subject (its subject 8, a single-session patient) was one complete person;
- e.g. its subject 1 (documented as a healthy control) was `Patients/EEG/subject9` sessions 1-2 plus `Patients/EEG/subject3` session 2.

## Where the true mapping comes from

The figshare record of the article version (`GET https://api.figshare.com/v2/articles/28955456/versions/4`) carries `folder_structure`: figshare file id -> depositor folder for all 494 files. The 98 EEG epoch files sit in `epo_data/{Normals,Patients}/EEG/subject<N>/<k>_epo.mat`. Checks made against the real files (all agree, no file is ambiguous):

| check | result |
|---|---|
| article ZIP (13.2 GB): central directory + MD5 of every member | 494 members, each matched by size + MD5 to a figshare file id; every member path = `folder_structure` folder + name; 98/98 EEG epoch files agree |
| creation time in each MAT header (`Created on: ...`) | the 98 files form 37 contiguous time blocks, exactly the 37 folders; within each block the sessions are in order 1, 2, 3, 3-4 s apart |
| start time of the raw recordings (`source_data/.../subject<N>/<k>.hdf5`, same folders) | every subject with several sessions: all sessions on one day, in session order, 15-18 min apart (consecutive runs of one visit) |
| per-session spectral fingerprint (log-PSD 4-38 Hz x 32 channels; MI epochs, eyes-open and eyes-closed baselines) | folder mapping: same-subject AUC 0.97 / 0.98 / 0.99; previous mapping: 0.55 / 0.54 / 0.58; permutation null mean 0.50 (p99 0.57) |
| per-file size and MD5 | 98/98 equal to figshare's `computed_md5` |

Result: subjects 1-17 = `Normals/EEG/subject1..17` (healthy controls), subjects 18-37 = `Patients/EEG/subject1..20` (ICH patients, subject = 17 + N), session `str(k - 1)` = `<k>_epo.mat`. 98 sessions (3 for 25 subjects, 2 for subjects 1, 23, 24, 26, 28, 32-37, 1 for subject 25), 2,940 trials (15 per class per session).

## Changes

- `moabb/datasets/hefmi_ich2025.py`
  - The mapping is derived from the record's `folder_structure` (fetched once and cached as `figshare_article_28955456_v4.json` next to the data; the `fill_from_store` lookup of the old file list is kept for it, so a rebuilt deposit can serve it). The loader also ships the 98-row map (file id, group, folder subject, session, size, MD5); it is used when the record cannot be fetched (an answer without `folder_structure`, e.g. an error page, is not cached), and kept with a `RuntimeWarning` if the record ever disagrees with it.
  - Every file is downloaded by its figshare id into the depositor's layout (`MNE-hefmiich2025-data/epo_data/<group>/EEG/subject<N>/<k>_epo.mat`) and checked against its size and MD5; a corrupt local file is downloaded again, a download that does not match raises. The new paths cannot collide with the previous `subNN_k_epo.mat` cache.
  - The upload-order grouping (`_MANIFEST`, `_get_manifest`, the cached file list) is removed. Load errors are no longer swallowed per session.
  - `nemar_id` is no longer declared: the deposit `nm000347` files the epochs under the former subjects (its `sourcedata_provenance.json` assigns `sub01_1_epo.mat` ... to the old subject ids), so `download()` would fetch other people's files and `get_data()` would prefetch them before going to figshare anyway. Added to `NEMAR_ID_EXEMPT` with that reason; declare it again once the deposit follows the folders.
  - Docstring: cohort (17 healthy + 20 ICH), sessions = consecutive runs of one visit, the mapping and its evidence, a note that results from earlier versions must be recomputed. `METADATA`: study design (1-3 sessions, 98 in total), `n_trials` 3,330 -> 2,940. `n_subjects` (37) and `sessions_per_subject` (3, the typical subject) were already right.
- `summary_imagery.csv`: `#Sessions` `3` -> `3 (1-3)`, `Total_trials` 3330 -> 2940.
- `whats_new.rst`: Bugs entry, with the explicit instruction to **delete cached HefmiIch2025 epochs and saved results from before the fix and recompute** (MOABB has no per-dataset cache version, so a cache built with the former grouping would be reused as is).
- Tests: new `moabb/tests/test_hefmi_ich2025.py` (synthetic record and files, no network); the three tests of the removed file-list/manifest code are removed from `test_nemar_store_names.py` and `test_dataset_fixes.py`.

## Tests

Offline, mocked figshare record and downloads (synthetic data):
- the record's `folder_structure` gives exactly the shipped map (with fNIRS epochs, raw recordings and the code archive in the record as distractors);
- known files: `Patients/EEG/subject9/2_epo.mat` (54452000) -> subject 26, session `"1"`; `Normals/EEG/subject1/1_epo.mat` -> subject 1, `"0"`; `Normals/EEG/subject7/3_epo.mat` -> subject 7, `"2"`; `Patients/EEG/subject8/1_epo.mat` -> subject 25 (its only session);
- counts: 37 subjects, 98 sessions numbered from `"0"` without gaps, 25/11/1 subjects with 3/2/1 sessions, 37/36/25 files `1/2/3_epo.mat`, controls 1-17 and patients 18-37, `METADATA` agrees;
- the upload-order grouping is gone: replayed on the same record it yields 23 mixed subjects; the loader's mapping never mixes folders;
- `data_path`: depositor layout and session order, no re-download of intact files, record cached, corrupt file replaced, mismatching download rejected, shipped map used offline, an answer that is not a record not cached (and a bad cached one refetched), `RuntimeWarning` when the record disagrees;
- `_get_single_subject_data`: session `str(k - 1)` holds `<k>_epo.mat`, labels and first/last trials of each file.

Red/green on the real figshare record (v4) with downloads stubbed: on `develop` (7dca06c), `data_path(1)` requests file 54451994 = `Patients/EEG/subject9/1_epo.mat`; with this branch it requests 54452621 = `Normals/EEG/subject1/1_epo.mat` (and subject 26 gets `Patients/EEG/subject9`).

Local gate: `test_hefmi_ich2025.py`, `test_datasets.py`, `test_metadata.py`, `test_doi_validation.py`, `test_nemar_store_names.py`, `test_dataset_fixes.py`, `test_cnbi_offline.py`, `test_chang2025_zips.py` with `-m "not network and not download and not slow"`, deselecting `TestData::test_epochs` and `Test_Datasets::test_dataset_accept` (real downloads): 2,902 passed, 458 skipped, 610 deselected, 0 failed on 294830c. `pre-commit` clean.

Real data (cluster node, source at 294830c, empty `MNE_DATA`, default `"auto"` provider; also run at e42f3160 with the same result): the live v4 record (494 files, 494 folder entries) gives exactly the shipped map, no warning; `LeftRightImagery(fmin=4, fmax=38).get_data` for

| subject | files (session "0", "1") | X | left / right | per session |
|---|---|---|---|---|
| 1 | `Normals/EEG/subject1/1_epo.mat` (54452621), `2_epo.mat` (54452645) | (60, 32, 2561) | 30 / 30 | 15 / 15 each |
| 26 | `Patients/EEG/subject9/1_epo.mat` (54451994), `2_epo.mat` (54452000) | (60, 32, 2561) | 30 / 30 | 15 / 15 each |

Every file passed its size/MD5 check; sessions, file ids, class counts and shapes equal the counts verified independently on all 98 files (2,940 trials, 1,470 per class). Median |X| 3.5 and 5.2 µV.

`Link Check` fails on `https://github.com/qinxwew` (404) in older `whats_new.rst` entries; the same check fails on `develop`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f3941890d885`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.