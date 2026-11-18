# Issue

**Title:** Mainsah2025: take the file list from the store provenance before fetching SHA256SUMS.txt from PhysioNet

## Description

Every Mainsah2025_* load fetched `SHA256SUMS.txt` from PhysioNet even when all EDFs came from the NEMAR store (audit Phase B: Mainsah2025_B 6/6, _K 1/1 subjects hit physionet-open.s3).

`_get_manifest` now first builds the same {study:{subject:{session:[rel_paths]}}} dict from the active store's `sourcedata_provenance.json`, keeping only EDFs present in the store whose bytes match the provenance SHA-256 (the same hash SHA256SUMS.txt lists). Only on a store miss does it fetch the index upstream. Adds `dl.active_store()` accessor.

Test: `moabb/tests/test_mainsah2025_store_manifest.py` — store with one provenance-verified EDF, sockets and download_if_missing forbidden; fails on develop, passes here.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5df9ccc1dce9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.