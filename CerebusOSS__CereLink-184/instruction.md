# Issue

**Title:** Match CMP rows to channels by (bank, term); repurpose position[] for x/y/size/headstage

## Description

This reworks how Blackrock `.cmp` channel-map files are applied to a device's in-memory channel config. Previously a CMP row was matched to a channel by an ordinal channel ID (the Nth row, after sorting by bank/electrode, was assigned `start_chan + N`), and the four `cbPKT_CHANINFO.position[]` slots held `{col, row, bank_letter_idx, electrode}`. We now match each row to a live channel by the device's own `(bank, term)` — read straight from chaninfo — and repurpose `position[]` to carry true geometry: `{x, y, size, headstage_id}`. Matching by `(bank, term)` is more robust to incomplete CMPs (a file missing channels still lands on exactly the right ones) and frees the `position` slots that were previously doing double duty as match keys. Column order is now read from the file's header line rather than assumed, and default electrode-index grids are converted to micrometers.

## Motivation

`bank` and `term` already exist on `cbPKT_CHANINFO` and are exactly what the old `position[2]`/`position[3]` (bank-letter-index, electrode) duplicated, so keying on them removes the duplication and the fragile ordinal assumption. With bank/term out of `position`, the four slots are freed to carry real geometry (`x`, `y`, `size`, `headstage_id`).

## What changed

### Bank/term matching (C++ SDK)

- `parseCmpFile` now returns entries keyed by `cmpKey(bank, term)` instead of by ordinal channel ID. `CmpEntry` carries `{x, y, size, headstage, bank, term, label}`. The previous sort-and-assign step is gone because row order no longer matters.
- `start_chan` now selects which physical banks a CMP targets: every CMP bank letter is shifted by `start_chan / 32` banks (e.g. `start_chan = 129` → `+4` banks → CMP bank A maps to device bank E). This makes `(bank, term)` globally unique across headstages on one device (headstage 1 → banks A–D, headstage 2 → banks E–H), so it is a valid join key.
- `SdkSession::applyCmpToAllChannels` and the CHANREP receive-thread overlay now iterate live channels, look up the CMP entry by the channel's own `(bank, term)`, and write `position[0..3]`. `loadChannelMap` discovers which channels matched (for the device-side label push) by joining live chaninfo on `(bank, term)`, and `clearChannelMap` discovers the previously-mapped channels the same way before dropping the overlay.

### position[] now holds {x, y, size, headstage_id}

- `position[0]`/`position[1]` are the electrode column/row, as before. `position[2]` is a new electrode `size` (same units as x/y; 0 = unspecified). `position[3]` is the `headstage_id` (the `hs_id` argument). These replace the old `{col, row, bank, electrode}` layout. `getChannelPositions` is unchanged (it already returns all four slots); the values it surfaces now carry the new meaning.

### Header-driven columns and a `size` column

- Column order is taken from the `//`-comment header line immediately before the data when present (manufacturer files carry one, e.g. `//col row bank elec label`; manually authored files may add a `size` column). Column names are matched case-insensitively (col/c, row/r, bank/b, elec/e, size/s, label/l), so the order is not assumed. When no header is present the legacy positional order `col row bank electrode [label]` is used, so every existing `.cmp` file parses unchanged.

### Electrode positions in micrometers

- When no `size` column is supplied and the col/row values form a unit-spaced index grid (every non-zero delta among the distinct col and row values is exactly 1 — the manufacturer default), the values are interpreted as electrode indices: `size` becomes 1 and x/y/size are scaled by the 400 µm Blackrock Utah-array electrode pitch. When a `size` column is present, or the spacing is non-uniform (e.g. the 128-channel manufacturer sample, whose row deltas are {1, 4}), col/row/size are taken at face value. The delta test — rather than a hard value-range cap — is the scaling trigger, because the default files have col indices up to 15 yet are still unit-spaced grids that should scale.

### Labels are no longer prefixed with `hs{N}-`

- Because the headstage id is now stored in `position[3]`, it no longer needs to be encoded into the label to keep reused labels unique across headstages. Labels are taken verbatim from the CMP file. `hs_id` now only feeds the `headstage` field; it does not alter labels. Trade-off: two channels on different headstages can now carry identical label strings in `cbPKT_CHANINFO.label`, distinguished only by `headstage`/`bank`/`term`. Any consumer keying channels purely by label string should be aware of this.

### pycbsdk parser brought in sync

- `pycbsdk/src/pycbsdk/cmp.py` (a standalone dump/CLI tool — live device config re-parses the file in C++ via `load_channel_map`) was updated to mirror the C++ parser: entries keyed by `(bank, term)`, the `start_chan // 32` bank offset, the optional `size` column, verbatim labels, and `hs_id` stored as `headstage`. Two stale docstrings in `pycbsdk/src/pycbsdk/session.py` (`load_channel_map`, `get_channels_positions`) were corrected to describe the new behavior.

## Testing

- C++ unit tests (`tests/unit/test_cmp_parser.cpp`) were rewritten for the new keys/struct and cover the bank offset, the optional size column, verbatim labels, and that `hs_id` sets `headstage` rather than the label. All pass against a clean `cbsdk` build.
- pycbsdk unit tests (`pycbsdk/tests/test_cmp.py`) were rewritten similarly — 12 pass.
- The hardware-gated nplay integration tests (`pycbsdk/tests/test_configuration.py::TestCMP`) were reworked to join device readback to parser output by `(bank, term)` via `ChanInfoField.BANK`/`TERM`, compare `position == (x, y, size, headstage)`, and expect verbatim labels. They collect cleanly; they require an nplay device to run.

## Notes / assumptions

- Positions are a local/shmem overlay only; the device does not persist them, so there is no position push to the device (labels are still pushed via `CHANSETLABEL`).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `741c0c9f519f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.