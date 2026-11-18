# Issue

**Title:** Extract margin tapering and make chunk ownership explicit

## Description

`get_chunk_with_margin` can return a view of parent data when no padding or casting is needed. Moving tapering outside that helper therefore requires an explicit way to obtain a buffer that callers can safely modify.

This extracts a private `_taper_margins(traces, window)` helper and adds `copy=True` to both margin helpers. `phase_shift` requests an owned buffer and builds its raised-cosine window once per segment, reusing it across chunks. Existing `window_on_margin=True` behavior remains supported.

Split out from #4563 because the FIR implementation no longer depends on this refactor.

Validation: six focused tests pass, including exact agreement with the legacy FFT path for int16, float32, and float64 inputs, and checks that read-only parent arrays remain untouched at interior and boundary chunks.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `797065e03344`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.