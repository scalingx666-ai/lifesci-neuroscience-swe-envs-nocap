# Issue

**Title:** PERF: Vectorize cross-spectral density calculation across channel pairs in _csd_morlet

## Description

#### reference issue (if any)

<!-- No issue opened; direct performance optimization -->

#### what does this implement/fix?

in `mne.time_frequency.csd._csd_morlet`, the cross-spectral density across channel pairs was calculated with a python loop and `np.vstack`.

this PR replaces the loop with batched BLAS matrix multiplication (`psds @ psds.conj().swapaxes(-1, -2)`) and `np.triu_indices`, like the implementation in `_csd_triu_from_mt` (#14355).

<img width="2180" height="989" alt="csd_morlet_benchmark" src="https://github.com/user-attachments/assets/a2d75b9d-e7bf-4e10-8b02-1013ac95a4e0" />

### benchmark results ($N_{\text{freq}}=20, N_{\text{times}}=1000$)

| channels | original (ms) | vectorized (ms) | speedup |
| :--- | :--- | :--- | :--- |
| 16 | 13.6 ms | 2.7 ms | 5.0x |
| 32 | 50.5 ms | 6.2 ms | 8.2x |
| 64 | 208.4 ms | 15.8 ms | 13.2x |
| 128 | 898.3 ms | 39.8 ms | 22.6x |
| 256 | 3528.5 ms | 98.9 ms | 35.7x |

i checked that the results are the same with `assert_allclose(..., rtol=1e-12, atol=1e-12)`.

<details>
<summary>benchmark script</summary>

```python
import time
import numpy as np

channels = [16, 32, 64, 128, 256]
n_freqs, n_times = 20, 1000

for ch in channels:
    psds = np.random.randn(ch, n_freqs, n_times) + 1j * np.random.randn(ch, n_freqs, n_times)
    psds_conj = np.conj(psds)

    t0 = time.perf_counter()
    csds_orig = np.vstack([np.mean(psds[[i]] * psds_conj[i:], axis=2) for i in range(ch)])
    t_orig = time.perf_counter() - t0

    t0 = time.perf_counter()
    p = psds.transpose(1, 0, 2)
    ii, jj = np.triu_indices(ch)
    csds_vec = ((p @ p.conj().swapaxes(-1, -2)) / p.shape[-1])[:, ii, jj].T
    t_vec = time.perf_counter() - t0

    np.testing.assert_allclose(csds_orig, csds_vec, rtol=1e-12)
    print(f"{ch:3d} ch: {t_orig*1e3:6.1f}ms -> {t_vec*1e3:5.1f}ms ({t_orig/t_vec:4.1f}x)")
```

</details>

#### additional information

i found the loop myself and adapted the batch matrix multiplication pattern from `_csd_triu_from_mt`. i used gemini to help with the benchmarking and the plotting. all tests and numerical parity checks pass locally.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d62cb15e06ec`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.