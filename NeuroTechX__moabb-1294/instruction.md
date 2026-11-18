# Issue

**Title:** download_if_missing: take a missing file from the NEMAR store first (Mainsah2025 SHA256SUMS.txt)

## Description

Only `data_dl`/`data_path` looked in the active NEMAR store. `download_if_missing` went straight to the network, so Mainsah2025 fetched PhysioNet's `bigp3bci/1.0.0/SHA256SUMS.txt` on every fresh machine, even though NEMAR already served all its EDFs. The same applies to the other `download_if_missing` users (Kojima, ErpCore2021, Dreyer2023, Lee2021Mobile, Zhou2016).

`download_if_missing` now calls `_store_lookup(url)` before downloading, the same URL-tail lookup `data_dl` uses, and hard-links the store file. With `force_update` it still downloads.

For Mainsah2025 this takes effect once each study's deposit has `sourcedata/SHA256SUMS.txt`, with no subject. Every study class reads only its own deposit, so the file is needed in all 20.

Tests (`test_nemar_download_if_missing.py`): the file is linked from the store with no download, `force_update` skips the store, and `Mainsah2025_A` builds its subject index from the deposit's `SHA256SUMS.txt` with sockets forbidden. Two of them fail on develop.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `421b9f736c13`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.