# Issue

**Title:** fix(datasets): raise when a NeuroVault collection downloads no images

## Description

Follow-up from the 0.6.0 hygiene sweep (#535), category "exceptions swallowed".

`fetch_neurovault_collection` wraps nilearn's `fetch_neurovault_ids`, which logs per-image download failures and returns whatever succeeded, so a NeuroVault outage or an emptied collection produced `([], empty frame)` with no error. The strict docs build on master 9ceba159 then failed one step later with `ValueError: List is empty` from `BrainData(nv_files, ...)`, which named the wrong cause.

The fetcher now raises `RuntimeError` naming the collection when nilearn hands back no images. One test monkeypatches the nilearn call to return nothing; no network. No migration row: v0.5.1's fetcher swallowed the same failure.

Gates: `uv run poe ok`, the datasets tests at `-m ''`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `60af6afcf5db`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.