# Issue

**Title:** Enable nemar_seed_cache for GuttmannFlury2025_SSVEP, Nguyen2017_L, Zhang2025, Zheng2020

## Description

With the default `"auto"` provider these four loaders fetched the subject's NEMAR sourcedata and then downloaded the same files again from Zenodo/figshare: they keep their files under names the URL lookup of `data_dl` cannot match (an extracted per-subject ZIP, figshare file ids). Their loaders check their own cache before downloading and their deposits are snapshots of that cache, so `nemar_seed_cache = True` is enough:

| dataset | deposit (latest) | loader reads | deposit check |
|---|---|---|---|
| GuttmannFlury2025_SSVEP | nm000310 v1.0.4 | `SSVEP/Sxx/SessNN/SSVEPxxN[bis].bdf` + `_annotations.json`/`_sync.csv`, 1-3 sessions | all 31 subjects, every session of `_SESSIONS_PER_SUBJECT` |
| Nguyen2017_L | nm000252 v1.0.3 | `Long_words/sub-NN.mat` | 6/6 |
| Zhang2025 | nm000211 v1.0.3 | `S<n>.mat` | 15/15 |
| Zheng2020 | nm000205 v1.0.4 | `G<g>/G<g>D1.mat`, `G<g>D2.mat` | 7/7 groups (14 subjects); the manifest has no `subject` field, so the first load fetches and seeds all groups (the prefetch already did) |

The deposits were checked file by file against each loader's subject/session list (metadata only: `sourcedata_provenance.json` of the latest release).

Test: `test_nemar_seed_cache_first_loaders.py` seeds one later subject from a store laid out like the deposit and calls `data_path` with downloads and sockets forbidden (fails on develop: nothing is seeded, the download is attempted).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7f3044c7e70d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.