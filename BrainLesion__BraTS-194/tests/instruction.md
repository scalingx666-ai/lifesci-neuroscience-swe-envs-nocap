# Issue

**Title:** fix: support InvenioRDM Zenodo file links

## Description

## Summary

. Zenodo's InvenioRDM API no longer returns `links.archive`, so `_get_zenodo_metadata_and_archive_url` raised `KeyError: 'archive'` before any inference started (affected e.g. `BraTS24_2`).

- `_select_archive_urls`: prefer the legacy `links.archive`, otherwise use the record's `.zip` entries via `files[].links.self`; raise `ZenodoException` when no downloadable `.zip` exists.
- `_get_zenodo_metadata_and_archive_url` now returns `(metadata, list[str])`; `check_additional_files_path`/`_download_additional_files` handle one or more URLs and clean up a partially populated version folder on failure.
- `_extract_archive` streams the archive to a temp file on disk instead of buffering the whole (multi-GB) archive in memory.

This is a strict subset of the `zenodo.py` changes already in #190 (the verification-suite PR); staging/read-only-cache changes are intentionally left to that PR.

## Before / after

```
# main
_get_zenodo_metadata_and_archive_url("14413387")  -> KeyError: 'archive'

# this PR
_get_zenodo_metadata_and_archive_url("14413387")
  -> ("1.0.0", ["https://zenodo.org/api/records/14413388/files/brats24_adult_glioma_kimbab_additional_files.zip/content"])
```

## Tests

- Mocked coverage for the InvenioRDM payload (`files[].links.self`), zip-only selection, multiple zips, missing/no-zip records, multi-URL download and partial-failure cleanup, and streaming extraction.
- Opt-in network test (`pytest -m network`) against record `14413387` that reproduces the original failure on `main` and passes here.

## Verification

- `uv run pytest` — 130 passed, 1 deselected
- `uv run pytest -m network` — 1 passed
- `uv run ruff check .` / `ruff format --check .` — clean

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1a0308e4ac70`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.