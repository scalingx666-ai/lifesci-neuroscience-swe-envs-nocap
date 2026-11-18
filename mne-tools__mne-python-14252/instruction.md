# Issue

**Title:** Normalize byte order before calibrating strided integer buffers

## Description

#### What does this implement/fix?

Instrumenting the FIFF read loop on a 133 MB file shows where the time actually
goes:

| stage | int16 file | float32 file |
|---|---|---|
| `fid.seek` | 0.1% | 0.1% |
| tag read (I/O + `frombuffer`) | 6.6% | 13.2% |
| `reshape` | 0.1% | 0.1% |
| **`_mult_cal_one`** | **93.0%** | **86.4%** |

It is not I/O. FIFF stores data **sample-major**, so `_read_segment_file` hands
`_mult_cal_one` the transpose of a big-endian tag: `one` has shape
`(376, 600)` with strides `(2, 752)`, so consecutive samples of one channel are
752 bytes apart — a cache line per element. A single `np.multiply` is then asked
to byte-swap, cast to float64, transpose and scale all at once, and NumPy has no
fast ufunc loop for input that is byte-swapped *and* strided, so it swaps
element by element.

Swapping up front in one contiguous pass is cheaper.

#### Numbers

Median of 6 interleaved process pairs against a pristine `main` worktree:

| case | main | this PR | |
|---|---|---|---|
| FIFF 133 MB int16 | 109.3 ms | 91.9 ms | **1.19x** |
| FIFF 13 MB `test_raw.fif` | 9.27 ms | 7.72 ms | **1.20x** |
| FIFF 263 MB float32 | 99.8 ms | 101.9 ms | 0.98x |
| CTF / EGI / Artemis123 / BrainVision | — | — | 0.98–1.01x |

#### Why the guard is narrow

The win is narrow, so the guard is too. Measured across every dtype and layout
the readers actually produce:

| input | effect |
|---|---|
| big-endian int, strided (FIFF, EGI simple-binary) | **1.28–1.33x** |
| big-endian int, contiguous (CTF) | ~1.00x → skipped |
| big-endian float (Artemis123, float32 FIFF) | 0.85–1.15x, unreliable → skipped |
| 8-byte input | 0.52–0.76x → skipped |
| native byte order | untouched |

An earlier version without the float exclusion regressed Artemis123 to 0.90x,
because it reads in 16 MiB blocks and the `astype` temporary blows cache. The
float and contiguity conditions exist to avoid exactly that.

For calibration: native `>i2` transposed costs 169 µs against 247 µs
byte-swapped, and this change reaches 186 µs — it recovers essentially the whole
byte-swap penalty. What remains is an inherent cache-hostile transpose.

#### Correctness

- Bit-identical to `main`: **37/37** readable fixtures across 18 formats
  compared with `np.array_equal`.
- `pytest mne/io mne/_fiff mne/tests/test_epochs.py mne/tests/test_evoked.py`:
  1196 passed.

#### Additional information

AI disclosure: I directed the work and reviewed and tested every change; Claude
Code (Claude Opus 5) instrumented the read loop, ran the dtype/layout matrix and
the A/B measurements, and made the edits under my direction.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3e783e64dddb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.