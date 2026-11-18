# Issue

**Title:** Fix TypeError writing ANT Neuro .cnt files by disambiguating the reader

## Description

.

### Problem

`write_raw_bids()` raises a `TypeError` when writing ANT Neuro eego recordings:

```
TypeError: read_raw_cnt() got an unexpected keyword argument 'fname'
```

The `.cnt` extension is **ambiguous** — it is used both by Neuroscan (read via `mne.io.read_raw_cnt`, kwarg `input_fname`) and by ANT Neuro eego recordings (read via `mne.io.read_raw_ant`, kwarg `fname`). When `write_raw_bids` re-reads the original file to obtain an unmodified copy (`write.py`), it picked the reader purely from the file extension:

```python
raw_orig = reader[ext](**raw._init_kwargs)
```

So a `raw` loaded with `read_raw_ant` (whose `_init_kwargs` use `fname`) was re-read with `read_raw_cnt`, which does not accept `fname` → `TypeError`.

### Fix

As suggested by @larsoner in the issue, the reader is now chosen from the **class of the `raw` object** rather than from the (ambiguous) extension. A small `reader_by_raw_class` map (currently `{"RawANT": read_raw_ant}`, guarded by `hasattr(io, "read_raw_ant")` for older MNE) takes precedence over the extension-based `reader` lookup, via a new helper `_reader_for_raw(raw, ext)`. Unambiguous extensions are unaffected (they fall through to `reader[ext]` exactly as before).

This re-reads the original file with the same reader that created it, so `raw._init_kwargs` always match.

### Verification

- New offline regression test `test_reader_for_raw_ambiguous_extension` (no data required): asserts that a `RawANT`-classed object resolves to `read_raw_ant` while a `RawCNT`-classed object and unambiguous extensions still resolve to the extension-based reader, and documents the root-cause kwarg mismatch (`fname` vs `input_fname`). Fails on `main` (helper absent / wrong reader), passes with the fix.
- `ruff check` / `ruff format` clean; `test_write.py` collects without errors.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e4c8487412ca`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.