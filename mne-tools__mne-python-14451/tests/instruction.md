# Issue

**Title:** PERF: Vectorize electrical distance matrix in compute_bridged_electrodes

## Description

#### reference issue (if any)

<!-- No issue opened; direct performance optimization -->

#### what does this implement/fix?

following up on the channel-pair vectorization in #14449, this PR fixes another $O(N^2)$ pairwise loop in `mne.preprocessing.compute_bridged_electrodes`.

before this, the pairwise electrical distance matrix and the bridged channel pairs were found using two nested python loops over the channel pairs. for high-density recordings (128-256 channels), this means 8,000 to 32,000 loop iterations of `np.var`.

using the variance identity $\text{Var}(X - Y) = \text{Var}(X) + \text{Var}(Y) - 2\text{Cov}(X, Y)$, this PR vectorizes the calculation across all epochs and upper-triangle channel pairs at once, with batched matrix multiplication (`centered @ centered.swapaxes(-1, -2)`) and `np.triu_indices`.

<img width="2180" height="989" alt="bridged_electrodes_benchmark" src="https://github.com/user-attachments/assets/a14865f7-8303-48e3-89d2-3f8d7e1f1d13" />

### benchmark results ($N_{\text{epochs}}=20, N_{\text{times}}=1000$)

| channels | original (ms) | vectorized (ms) | speedup |
| :--- | :--- | :--- | :--- |
| 32 channels | 18.1 ms | 2.4 ms | 7.6x |
| 64 channels (EEG) | 77.5 ms | 6.9 ms | 11.2x |
| 128 channels (HD-EEG) | 319.8 ms | 28.9 ms | 11.1x |
| 256 channels (high density) | 1978.5 ms | 74.9 ms | 26.4x |

i checked that the results are the same with `assert_allclose(..., atol=1e-12)`.

<details>
<summary>benchmark script</summary>

```python
import time
import numpy as np

channels = [32, 64, 128, 256]
n_epochs, n_times = 20, 1000

for ch in channels:
    data = np.random.randn(n_epochs, ch, n_times)

    # Original
    t0 = time.perf_counter()
    ed_old = np.full((n_epochs, ch, ch), np.nan)
    for i in range(ch):
        for j in range(i + 1, ch):
            ed_old[:, i, j] = np.var(data[:, i] - data[:, j], axis=1)
    t_orig = time.perf_counter() - t0

    # Vectorized
    t0 = time.perf_counter()
    ed_new = np.full((n_epochs, ch, ch), np.nan)
    centered = data - np.mean(data, axis=-1, keepdims=True)
    cov = (centered @ centered.swapaxes(-1, -2)) / data.shape[-1]
    var = np.diagonal(cov, axis1=1, axis2=2)
    ii, jj = np.triu_indices(ch, k=1)
    ed_new[:, ii, jj] = var[:, ii] + var[:, jj] - 2 * cov[:, ii, jj]
    t_vec = time.perf_counter() - t0

    np.testing.assert_allclose(ed_old[:, ii, jj], ed_new[:, ii, jj], atol=1e-12)
    print(f"{ch:3d} ch: {t_orig*1e3:6.1f}ms -> {t_vec*1e3:5.1f}ms ({t_orig/t_vec:4.1f}x)")
```

</details>

#### additional information

i found the loop myself and worked out the vectorized covariance identity to remove the nested channel-pair loops. i used gemini to help with benchmarking the runtime for different channel counts and with making the benchmark comparison plot. all existing tests pass locally.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `87105f4dd856`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.