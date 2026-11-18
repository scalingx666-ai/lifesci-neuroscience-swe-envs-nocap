# Issue

**Title:** Serve dataset downloads from NEMAR's sourcedata/, and add a provider switch

## Description

NEMAR deposits now republish the **original, pre-BIDS distribution** under `sourcedata/` — byte-identical to what the upstream host serves, under the same upstream filenames, with a `sourcedata_provenance.json` recording each file's name, size and SHA-256. That makes NEMAR usable as a mirror of the original source, which matters because those upstream hosts are variously slow, rate-limited, bot-gated, or retired.

`download()` now fetches that tree instead of the deposit's BIDS copy.

## Why `sourcedata/` and not the BIDS copy

This is the crux, so it is worth being explicit. The BIDS copy is a **re-encoding**, and substituting it would change *results*, not just change where the bytes come from:

- **Session/run labels** are derived from BIDS entities and do not match what a dataset's own loader produces. `Weibo2014` returns `{"0": {"0": raw}}` from one concatenated `RawArray`; `Lee2019` uses semantic `"1train"` / `"4test"` labels that have no BIDS equivalent at all.
- **Events differ, and the failure is silent.** `ErpCore2021` applies a 26 ms LCD-delay correction and remaps raw integer codes to `"Target"` / `"NonTarget"` via `handle_events_reading`. A BIDS-loaded raw carries the *unmapped* annotations; `events_from_annotations` then finds nothing, and `RawToEvents._find_events` swallows exactly that as zero events, so the run is dropped as empty — **no exception, so no fallback can catch it**. A user would get benchmark numbers computed on an empty or partial dataset.

`sourcedata/` sidesteps all of it: each dataset's own parser runs on the same files it always ran on. **Loading is untouched** — `get_data` still goes through `_get_single_subject_data`.

## What is here

- **`nemar_sourcedata_dl`** fetches a deposit's `sourcedata/`, and fails loudly when a deposit publishes none rather than leaving a confusing empty cache (nemar-py "succeeds" with zero matching files).
- **`BaseDataset.sourcedata_path`** — public accessor mirroring `data_path`'s contract. Optional `nemar_sourcedata_include` (e.g. `"sourcedata/subject_{subject:02d}.*"`) addresses one subject; without it the tree is fetched **once**, because `sourcedata/` keeps the upstream layout and there is no general subject→file rule to guess.
- **`set_download_provider` / `get_download_provider`** — `auto` (default: NEMAR first, upstream fallback), `nemar` (no fallback: a failure is raised rather than silently reaching for a host the caller opted out of), `upstream` (never NEMAR). Also settable per run via `MOABB_DOWNLOAD_PROVIDER`.
- Falls back to the dataset's own downloader **with a warning** when a deposit has no `sourcedata/`, so deposits that were never enriched keep working.

## Verification

Against live NEMAR: `Cattan2019_PHMD().download()` populates `.../nm000341/sourcedata` with 18 files and fetches **0** BIDS eeg files. Per-subject filtering with a template fetches exactly `subject_03.mat`.

`moabb/tests/test_download.py` passes, with new tests covering the scope requested, `include` forwarding, the no-sourcedata failure, provider precedence, per-subject vs whole-tree fetching, and the upstream fallback.

Requires the matching `nemar-py` change (nemarOrg/nemar-py#3) only for the `--sourcedata` CLI flag; the `scope="sourcedata"` API this uses already exists in the released version.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5f2979516843`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.