# Issue

**Title:** MAINT: extract _reconcile_channel_names from _handle_channels_reading

## Description

Pure no-op refactor addressing #1608.

Channel-name reconciliation between `raw.ch_names` and `channels.tsv` was spread across four blocks of `_handle_channels_reading`:

1. duplicate names within `channels.tsv` (dedup / warn / raise)
2. dropping a synthesized `STI 014` not present in the sidecar
3. length mismatch between sidecar and raw (warn-and-skip)
4. name-order mismatch (dispatch to `_handle_channel_mismatch`)

This PR moves all four into a new `_reconcile_channel_names(raw, channels_dict, on_ch_mismatch, channels_fname) -> bool` helper called once near the top of `_handle_channels_reading`. The helper returns `True` when the caller should bail out and skip applying types / units / bads. After the call, `_handle_channels_reading` focuses on what its name suggests — applying channels.tsv-derived metadata to an already-aligned `raw`.

Drive-by: `_handle_channel_mismatch` now returns an explicit `False` on the reorder/rename paths so the call site doesn't need a `bool(...)` cast to interpret `True | None`.

### Why now

@scott-huberty flagged the dispersion in  and Dan filed #1608 suggesting the sprint as a possible window. Doing the structural part now is cheap because the bodies move byte-for-byte; behavior-changing follow-ups (e.g., dropping the defensive `if ch_name in raw.ch_names` filters now that alignment is guaranteed when the helper returns `False`-and-non-length-mismatch) can land separately.

### Verification

- All 79 tests in `mne_bids/tests/test_read.py` pass unchanged.
- Channel-related tests in `mne_bids/tests/test_write.py` pass unchanged.
- Bodies of moved code are byte-for-byte identical to the pre-refactor state; only the `return raw` → `return True` adjustment for the dedup-warn path and the added `return False` in `_handle_channel_mismatch` change.
- Pre-commit (ruff + ruff-format) clean.

### Not included

- No `whats_new.rst` entry — pure internal refactor with no user-visible effect.
- The defensive `if ch_name in raw.ch_names` filters in the types/units/bads loops are kept as-is; tightening them is a behavior change worth its own PR.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `005fb44aafe3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.