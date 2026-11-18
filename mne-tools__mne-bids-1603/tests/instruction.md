# Issue

**Title:** FIX: more generous channels.tsv reading

## Description

Two friction points in `_handle_channels_reading` when reading real-world OpenNeuro datasets, plus a new opt-in mismatch mode.

- **Empty / headerless `channels.tsv`** — used to raise `KeyError: 'name'`. Now warns and skips channel metadata, same as if the sidecar were absent.
- **Duplicate channel names in `channels.tsv`** — used to raise `ValueError: New channel names are not unique`. Now treated as a sub-type of channel mismatch and routed through `on_ch_mismatch`:
  - `"raise"` (default): raises with a pointer to the rename/warn options.
  - `"rename"`: deduplicates by appending `-0/-1/...` suffixes so the rename succeeds.
  - `"warn"`: warns and skips channels.tsv-derived metadata, leaves `raw` untouched.
  - `"reorder"`: raises (reorder is ambiguous with duplicates).
- **New `on_ch_mismatch="warn"`** for the general name-mismatch case: warns and skips channels.tsv-derived metadata instead of raising.

```python
# before
KeyError: 'name'
ValueError: New channel names are not unique, renaming failed

# after (defaults unchanged: still raises on duplicates / mismatch)
read_raw_bids(..., on_ch_mismatch="rename")  # dedupes -> renames
read_raw_bids(..., on_ch_mismatch="warn")    # warns -> skips metadata
```

Tests cover all three branches (rename/raise/warn) for duplicates, plus the empty / wrong-header paths and the new `warn` mode for ordinary mismatches. Added next to the existing `test_channel_mismatch_*` family in `test_read.py` — no new test file.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9c1ec83a84e5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.