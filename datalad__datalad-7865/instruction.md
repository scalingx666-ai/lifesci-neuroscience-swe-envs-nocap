# Issue

**Title:** BF(UX): fix annex "Total" progress bar accounting & display

## Description

## Summary

`AnnexJsonProtocol`'s dataset-level "Total" progress bar (used by `datalad get`, `push`, and other commands that wrap `git annex … --json --json-progress`) had several long-standing accounting/display bugs that surface most visibly on large recursive runs like `datalad install -J3 -g ///repronim/containers`:

- `Total` only advanced on per-file completion records, so a single large-file `get` left it at 0 bytes until the file finished, then snapped to 100%.
- Failed records still credited the bar by the missing file's full key-size, producing impossible rate displays.
- Under `-J>1` the bar visibly dipped at every per-file completion (in-flight contributions of other files were dropped between throttled ticks).
- `git annex` resuming a partial download (first `byte-progress` already reports on-disk bytes, e.g. `189M/6.60G`) made the bar surge at t≈0 and report bogus rates like `701M Bytes/s`.
- The widget-level `tqdmProgressBar.update` reset elapsed-time accounting on every `total=` change (which `_emit_total_pbar_update` does on every error), producing `[00:00<00:00, 16.0T Bytes/s]` artefacts.

This PR rewrites the Total-bar accounting around *cumulative on-disk bytes for non-errored files* (numerator) vs `total_nbytes - error_bytes` (denominator), surfaces errored files in the bar label (`Total [errored: N / 1.3 TB]`), and uses `tqdm`'s `(n - initial) / elapsed` rate fallback (`smoothing=0`, the existing convention) to exclude resumed-from-disk bytes from rate/ETA — by pushing a `_resumed_bytes` anchor via a new `set_initial()` API plumbed through `log_progress` → `ProgressHandler.emit` → `tqdmProgressBar`.

here how looked before with datalad system wide 1.3.1 (I think we had no fixes to progress since then)

[![before](https://www.oneukrainian.com/tmp/screencast_2026-05-22_10-46-33.gif)](https://www.oneukrainian.com/tmp/screencast_2026-05-22_10-46-33.gif)

and now (I do not get why that one does not show -- it is https://www.oneukrainian.com/tmp/screencast_2026-05-22_10-44-59.gif ; might fix later)

[![before](https://www.oneukrainian.com/tmp/screencast_2026-05-22_10-44-59.gif)](https://www.oneukrainian.com/tmp/screencast_2026-05-22_10-44-59.gif)

## Commits

- 4b8441530 `BF(UX): make AnnexJsonProtocol "Total" pbar accurate, monotone, on-disk`
- e73b6317f `BF(UX): tqdmProgressBar: non-resetting total=, mid-flight set_initial`

<details><summary>Per-commit details</summary>

### 4b8441530 `BF(UX): make AnnexJsonProtocol "Total" pbar accurate, monotone, on-disk`

The bar now tracks cumulative on-disk bytes for non-errored files against `total_nbytes - _error_bytes`. `_byte_count` is updated by byte-progress deltas via a new `_credit_byte_progress()` helper: the first event for a file contributes its full `byte_progress` (the resume offset on disk), subsequent events the delta from `_inflight_credited[pbar_id]`. Successful completion adds `max(0, key_bytes - last_credited)` as the residual; failure rolls back the provisional credit and adds the full key-size to `_error_bytes`.

The per-file pbar is created with `initial=byte_progress` so its `tqdm` rate/ETA start from the resume point rather than jumping 0 → byte_progress in zero elapsed.

For the Total bar the same rate-anchoring is achieved by tracking `_resumed_bytes` (cumulative first byte-progress) and `_file_resume_offset` (per-file, so errors can roll it back), and pushing `_resumed_bytes` through `log_progress(... initial=...)` on every Total emit. `tqdm`'s rate fallback `(n - initial) / elapsed` (used when `smoothing == 0`, the mode for "Total" bars) then reports session work only, regardless of when each file's resume offset gets credited.

The Total pbar is created eagerly at `connection_made` (above per-file bars in `tqdm`'s display order); `_total_pbar_finished` prevents a late stray emit from re-emitting against a bar that has already been taken down. `_init_total_pbar_state()` factors the counter initialisation so tests mirror it without duplicating.

Failures are surfaced in the bar label as `Total [errored: N / <bytes2human>]`, and `_error_bytes` shrinks the effective total so ETA/rate reflect transferable work only. The completion-discard check compares against the effective total so an all-errors run ends the bar cleanly.

A new helper `_emit_total_pbar_update()` centralises label / effective-total / forward-`total=`-only-on-change / `initial=` plumbing.

### e73b6317f `BF(UX): tqdmProgressBar: non-resetting total=, mid-flight set_initial`

Two bar-display fixes whose effects compound with the protocol work above:

1. `tqdmProgressBar.update` previously routed every non-None `total=` through `tqdm.reset(total)`, which zeroes `n`, `start_t`, and the EMA accumulators, and then re-advanced to `self.current`. Each such call restarted the elapsed-time clock, so the next display divided the cumulative count by ~0 elapsed and printed absurd rates like `[00:00<00:00, 16.0T Bytes/s]`. Set `self._pbar.total` directly and `refresh()` only when the value actually changed; iteration count, start time and EMA state survive.

2. Add `set_initial()` to `ProgressBarBase` (no-op) and override it in `tqdmProgressBar` to write `self._pbar.initial`. Wire the log handler to apply `dlm_progress_initial` on update emits (not only on creation) by calling `set_initial`. `tqdm`'s rate fallback is `(n - initial) / elapsed` when `smoothing == 0`, so callers that credit "already-on-disk" bytes to `n` (the Total bar, after the previous commit) can push that anchor through and have `tqdm` exclude those bytes from the rate / ETA display.

</details>

<details><summary>Before / after</summary>

**Before** — single resumed file, `-J3`:
```
Total: 0%|  | 707M/2.61T [00:00<13:51:37, 701M Bytes/s]
Get images/bids/bids-aa--0.2.0.sif:  3%|▉ | 189M/6.60G [00:00<00:03, 1.73G Bytes/s]
```

**After** — same scenario:
```
Total [errored: 2 / 18.9 GB]: 0%| | 707M/2.61T [00:13<13:51:37, 52.3M Bytes/s]
Get images/bids/bids-aa--0.2.0.sif:  4%|█ | 249M/6.60G [00:15<10:51, 9.75M Bytes/s]
Get images/adswa/adswa-nilearn--0.9.1.sing: 62%|█████ | 310M/497M [00:14<00:06, 29.2M Bytes/s]
```

Rates are realistic, Total is back at the top of the display, the `errored` count is surfaced in the label, and the effective total has shrunk to exclude failed files.

</details>

## Test plan

- [x] 6 protocol-level tests in `datalad/support/tests/test_annexrepo.py` cover: in-flight crediting, success=false rejection, monotonicity under `-J>1`, resume-from-disk anchoring, partial-then-error rollback, all-errors finish. All `@pytest.mark.ai_generated`, share a `_make_annex_json_protocol()` helper that calls the same `_init_total_pbar_state()` as `connection_made`, so adding state fields only needs one edit.
- [x] All 49 `datalad/ui/tests/` tests pass against the `tqdmProgressBar.update` change.
- [x] Verified manually on `datalad install -J3 -g ///repronim/containers`: Total advances smoothly, dips honestly on partial-then-error, rate stays realistic across resume detections, bar finishes cleanly.
- [x] If the assigned PR number differs from `7865`, rename `changelog.d/pr-7865.md` accordingly.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `31278af95e5e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.