# Issue

**Title:** Speed up write_raw_bids for recordings with many channels

## Description

(PR and content generated with the help of Claude)

Three small, behavior-preserving optimizations on the channel-writing hot path in `write_raw_bids`. Each was verified to produce identical output to the previous code.

### Changes

1. **`pick.get_coil_types()` — cache the constant dict.**
   `coil_type()` is called once per channel and rebuilt this large dict of FIFF constants every time. It is now built once via `functools.cache`. (read-only, internal use only)

2. **`_sidecar_json()` — single-pass channel counting.**
   Replaced 11 separate `len([ch for ch in raw.info["chs"] if ch["kind"] == ...])` comprehensions (11 full passes building throwaway lists) with one `Counter` pass.

3. **`_write_raw_brainvision()` — fix quadratic unit loop.**
   The `"NA" -> "n/a"` fixup comprehension lived *inside* the per-channel loop, rebuilding the entire `unit` list on every iteration (O(n²)). Moved it to a single pass after the loop. The fixup is idempotent, so the result is identical.

### Measured impact (microbenchmarks, representative channel counts)

| Change | Before | After | Speedup |
|---|---|---|---|
| coil_type ×300 channels | 0.320 ms | 0.161 ms | ~2× |
| channel counting (279 ch) | 111.6 µs | 19.3 µs | ~5.8× |
| BrainVision unit loop (270 ch) | 655 µs | 35 µs | ~18.8× |

### Testing

- Equivalence checks confirm the new channel-counting and unit-loop code produce identical results to the originals across all channel kinds (including the `FIFF_UNIT_NONE -> "NA"` case).
- `test_write.py`, `test_pick.py`, `test_read.py`: 215 passed, 0 new failures. (The 7 pre-existing `curry` failures and skips are environmental and also fail on `main`.)

No behavior or output changes.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0c0b20df800d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.