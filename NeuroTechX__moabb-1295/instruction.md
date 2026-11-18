# Issue

**Title:** HefmiIch2025, AguileraRodriguez2025: read the files their NEMAR deposits keep under other names

## Description

Two loaders whose NEMAR deposits hold the files under names the URL lookup could not match:

**AguileraRodriguez2025** (nm000174): Mendeley serves `<uuid>/file_downloaded` with no extension, and the deposit keeps it as `file_downloaded.edf` / `.xdf`. `_store_lookup` now also accepts a single stored file that only adds an extension to an extension-less URL name. This applies only to tails of two or more segments, and an exact name still wins. Ambiguous variants, one-segment tails and URL names that already have an extension are not matched. The loader then works whether or not the deposit also carries alias entries.

**HefmiIch2025** (nm000347): the figshare file list came from a bare `requests.get` on `api.figshare.com`, and each epoch file was downloaded under its figshare id and then renamed. Now:
- the list is cached as `figshare_filelist_28955456.json` (MAMEM's naming);
- the cache is read from the store first, else fetched with `download.fs_get_file_list`;
- each epoch file is downloaded with `fname=<local name>`, so the store serves `subXX_N_epo.mat`.

The deposit needs `sourcedata/figshare_filelist_28955456.json`, with no subject, containing the JSON list `fs_get_file_list(28955456)` returns.

Tests (`test_nemar_store_names.py`): store-lookup variants, an Aguilera subject loaded from deposit-named files with sockets forbidden, and Hefmi's file list and epochs taken from the store with the figshare API forbidden. Four of them fail on develop.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2265577c9c9a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.