# Issue

**Title:** Leelakittisin2025, MOVING2024, Perdikis2018, Shin2022: take the extracted subject from NEMAR before downloading the archive

## Description

`data_path` of these loaders called `data_dl` on the whole archive before looking at what it extracts to. Their NEMAR deposits keep the extracted files, not the archive, so the archive URL never matched the store and every load under the default `"auto"` provider downloaded the archive from Zenodo/figshare although the subject was already local.

| dataset | archive | deposit (latest) | now taken from the store |
|---|---|---|---|
| Leelakittisin2025 | Zenodo `v1_raw_SNN.zip` | nm000330 v1.0.0 | `SNN/` (both session `.mat`) |
| MOVING2024 | Zenodo `edf.rar` (whole dataset) | nm000293 v1.0.0 | `extracted/edf/<timestamp>_Subj_NN_*.edf` |
| Perdikis2018 | Zenodo `<pilot>.tar.gz` | nm000307 v1.0.0 | the pilot directory |
| Shin2022 | figshare ZIP (all subjects) | nm000315 v1.0.0 | the LIVE directory `SNN_<date>/` (found with the new `download.store_glob`) |

Same pattern as #1293: look for the extracted subject first, place it with `fill_tree_from_store` (all or nothing), and only otherwise download and extract as before. Deposits checked against the loaders' subject lists (every subject holds the files the loader reads).

Tests: `test_nemar_archive_first_loaders.py` -- the subject is read from a store laid out like the deposit with `data_dl` and sockets forbidden (fails on develop), and the archive is still downloaded when the store lacks the subject.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `074a275cc25a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.