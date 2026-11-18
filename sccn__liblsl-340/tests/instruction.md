# Issue

**Title:** Optionally restart timestamp dejittering after a break in the stream

## Description

.

- New `[tuning]` keys `SmoothingBreakThresholdSeconds` and `SmoothingBreakThresholdSamples` (default 0 = off, today's behaviour). The threshold is the greater of the two (pyxdf semantics).
- `postproc_dejitterer::is_break(t)` computes the same prediction error as `al` in `dejitter()`; `time_postprocessor::process_internal` rebuilds the dejitterer at that sample, as it does at stream start. Judged per sample, absolute value, so backward steps restart too.
- `proc_monotonize` is unchanged: after a backward jump it still holds timestamps until time catches up (resetting it would break the monotonic guarantee the flag promises).
- `skip_samples` (flush) is unaffected: it advances the counter of the current fit, and a restart builds a fresh one.
- Unit test `rls_smoothing_break`: 300 s at 100 Hz with 2 ms jitter, 2 s pause. Off: error after resume > 1.5 s. On (1 s): error < 20 ms throughout.
- Docs: configuration table and time sync internals.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fb50e8e47cdc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.