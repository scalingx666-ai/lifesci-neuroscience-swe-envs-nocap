# Issue

**Title:** MIMED2024, Weibo2014, Shin2017A/B: take the subject's files from the NEMAR store before downloading

## Description

These loaders check their cache before downloading, but `nemar_seed_cache` cannot serve them:
- **Weibo2014** caches in `MNE-weibo-2014`, which has no `MNE-<sign>-data` root for the seeding to rebase on, and downloads Dataverse ids through `pooch.retrieve`.
- **Shin2017A/B** must keep their licence gate: seeding would hand out the data without `accept=True`.
- **MIMED2024** only tested whether the `Motor Imagery` directory exists, so a tree holding only some subjects (one filled from NEMAR, or by seeding) would return absent files instead of downloading.

Each now places the subject's files from the active NEMAR store with `fill_from_store` before downloading the Mendeley/Dataverse/TU Berlin archive (Shin2017 only with `accept=True`, as for the download):

| dataset | deposit (latest) | files |
|---|---|---|
| MIMED2024 | nm000296 v1.0.0 | `Motor Imagery/<3 scenarios>/PNN.mat` (30/30) |
| Weibo2014 | nm000146 v1.0.3 | `subject_N.mat` (10/10) |
| Shin2017A | nm000267 v1.0.3 | `EEG/subject NN/with occular artifact/{cnt,mrk}.mat` (29/29) |
| Shin2017B | nm000268 v1.0.3 | same (29/29) |

MIMED2024 now downloads whenever the subject's three files are absent and then extracts only the members not on disk (new `skip_existing` of `download_and_extract_subject_zip`), so the extraction never writes through a link into the store.

Tests: `test_nemar_store_fill_loader_cache.py` (subject from the store with downloads and sockets forbidden; download still happens when the store lacks the subject; the licence gate; `skip_existing`). Fails on develop.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2d8648d3db76`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.