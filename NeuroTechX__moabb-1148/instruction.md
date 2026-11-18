# Issue

**Title:** Prefetch the NEMAR sourcedata store in get_data()

## Description

## What

, closing the last gap in its "not in scope" list (*wiring the NEMAR sourcedata cache into `get_data`*): the store is only filled by an explicit `download()` call, so a **plain `get_data()` on a fresh machine still fetched from the upstream host even with the provider pinned to `"nemar"`** — and `get_data()` is what every evaluation and benchmark actually calls.

`get_data()` now fetches the requested subjects' `sourcedata/` into the store before loading, reusing `sourcedata_path()` and the provider policy `download()` already implements:

- `"upstream"` — skips NEMAR entirely (unchanged behavior)
- `"nemar"` — a NEMAR failure raises rather than silently reaching the host the caller opted out of
- `"auto"` — warns per subject and leaves that subject to the dataset's own downloader

A **non-empty store is trusted as-is and costs no network**, preserving the warmed-store guarantee `test_get_data_reads_the_nemar_store_end_to_end` encodes (`download(force_update=True)` refreshes it).

## Verification

Live on Nakanishi2015 (fresh caches, sample arrays hashed):

| mode | signal SHA | hosts during `get_data()` |
|---|---|---|
| provider=upstream, plain `get_data()` | `a835e50de5aa42a9` | github.com, raw.githubusercontent.com |
| develop: `download()` → `get_data()` | `a835e50de5aa42a9` | *(none)* |
| develop: plain `get_data()`, provider=nemar | `a835e50de5aa42a9` | **github.com** ← the gap |
| **this PR**: plain `get_data()`, provider=nemar | `a835e50de5aa42a9` | data.nemar.org, S3, raw (git-keyed sidecars) |

Bit-identical data in all modes; with this PR the upstream host is never contacted.

- `pytest moabb/tests/test_download.py` → 209 passed (5 new: provider semantics per mode, no-nemar_id skip, `get_data` prefetches exactly the requested subjects)
- `ruff check` / `ruff format` clean
- A broader 141-dataset upstream-vs-NEMAR equivalence sweep is running on Expanse against this branch; results will be posted here.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `daf514e7c8b9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.