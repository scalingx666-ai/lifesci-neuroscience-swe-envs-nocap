# Issue

**Title:** Chang2025: match the NEMAR deposit's MNE-chang2025-data/ prefix in the store lookup

## Description

Deposit nm000271 stores the figshare file as `sourcedata/MNE-chang2025-data/files/57432889`; `_store_lookup` probed `files/57432889` and missed, so every load downloaded the 3.6 GB ZIP (audit Phase B: Chang2025 2/2 subjects hit figshare/S3).

Pass `fname=f"MNE-chang2025-data/files/{file_id}"` to `dl.data_dl`: the explicit fname is probed first in the store, and the local destination keeps the same nested layout.

Test: `moabb/tests/test_chang2025_store.py` (store lookup unit + data_path serves/extracts the stored ZIP, sockets forbidden); fails on develop, passes here.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bb8d20478921`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.