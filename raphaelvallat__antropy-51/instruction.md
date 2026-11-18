# Issue

**Title:** [v0.2.2] perm_entropy improvements; better doc/doctest

## Description

## What's new

- **2D support**: `perm_entropy` now accepts arrays of shape `(n_epochs, n_times)` for `order=3` and `order=4`, computing entropy for all epochs in one call instead of looping with `np.apply_along_axis`.
- **Major speed-up**: 1.3–4.9× faster for 1D signals, 2–6× faster for 2D signals, compared to the previous implementation.
- **Deterministic results**: the previous implementation used an unstable sort, giving platform-dependent results on signals with tied values. All code paths now use a stable sort, so results are identical across operating systems, NumPy versions, and hardware.

```python
# Before: manual loop required
pe = np.array([ant.perm_entropy(epoch) for epoch in x])

# After: native 2D support
pe = ant.perm_entropy(x)  # x has shape (n_epochs, n_times)
```

## How it works

For `order=3` and `order=4` (the two most common settings), `argsort` is replaced by a small lookup table indexed by pairwise comparisons between delayed columns. Pattern counts are accumulated in a single vectorised `np.bincount` call across all epochs simultaneously.

For `order > 4`, the existing `argsort`-based path is retained (1D only) with two minor improvements: a zero-copy window view (`as_strided`) and a BLAS `@` product for hashing.

> [!NOTE]
> Ties (exact duplicate values within a window) are broken by position across all inputs and all orders — earlier position ranks lower, matching stable `argsort`. This covers integer arrays, quantized float signals, zero-padded epochs, and any other signal with duplicate values.

## Benchmarks

Three implementations are compared:

- **Original** — previous `antropy` implementation (unstable sort, no 2D support)
- **General** — improved fallback for `order > 4` (stable sort, 1D only)
- **Fast path** — new implementation for `order=3/4` (stable, 1D and 2D)

### 1D — single time series

| Order | Length | Fast path (µs) | General (µs) | Original (µs) | Fast vs General | Fast vs Original |
|------:|-------:|---------------:|-------------:|--------------:|----------------:|-----------------:|
| 3     | 1,000  | 26.4           | 35.6         | 46.7          | **1.3×**        | **1.8×**         |
| 3     | 5,000  | 50.6           | 123.4        | 189.2         | **2.4×**        | **3.7×**         |
| 3     | 10,000 | 98.9           | 241.3        | 356.2         | **2.4×**        | **3.6×**         |
| 4     | 1,000  | 28.0           | 43.2         | 56.6          | **1.5×**        | **2.0×**         |
| 4     | 5,000  | 55.4           | 159.1        | 238.7         | **2.9×**        | **4.3×**         |
| 4     | 10,000 | 91.5           | 307.5        | 447.5         | **3.4×**        | **4.9×**         |

### 2D — multi-epoch data (`n_epochs × n_times`)

Compared against `np.apply_along_axis` with the original implementation.

| Order | Epochs | Length | Fast path (ms) | Original loop (ms) | Speed-up         |
|------:|-------:|-------:|---------------:|-------------------:|-----------------:|
| 3     | 5      | 1,000  | 0.05           | 0.25               | **4.7×**         |
| 3     | 5      | 10,000 | 0.38           | 1.82               | **4.8×**         |
| 3     | 50     | 1,000  | 0.40           | 2.41               | **6.1×**         |
| 3     | 50     | 10,000 | 5.63           | 19.61              | **3.5×**         |
| 3     | 500    | 1,000  | 6.00           | 24.30              | **4.1×**         |
| 3     | 500    | 10,000 | 60.93          | 211.76             | **3.5×**         |
| 4     | 5      | 5,000  | 0.24           | 1.51               | **6.3×**         |
| 4     | 50     | 5,000  | 2.97           | 13.58              | **4.6×**         |
| 4     | 500    | 5,000  | 32.11          | 130.49             | **4.1×**         |

## Tests

- `test_perm_entropy_fast_path` — fast path matches the reference within `atol=1e-12` for `order=3/4`, across multiple delays and normalize settings.
- `test_perm_entropy_2d` — 2D output matches `apply_along_axis` of the reference row-by-row.
- `test_perm_entropy_ties` — signals with ties (integer arrays, float arrays, zero-padded, quantized) agree with a stable-sort reference for all orders and both dtypes.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ac5ec11056db`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.