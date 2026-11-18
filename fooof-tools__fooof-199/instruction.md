# Issue

**Title:** [ENH] Group shading

## Description

This is a point in #193 and adds shading around group spectra. By default, the shading defaults to +/- 1 stdev. This is bypassed if a 1d array is passed to `shade`.

```python
import numpy as np
from neurodsp.sim import sim_combined
from neurodsp.spectral import compute_spectrum
from fooof.plts import plot_spectra
from fooof.plts.error import plot_error_shade

components = {'sim_bursty_oscillation': {'freq': 10},
              'sim_powerlaw': {'exponent': -2}}

n_iters = 20

powers = np.zeros((n_iters, 50))

for idx in range(n_iters):
    sig = sim_combined(10, 1000, components)
    freqs, power = compute_spectrum(sig, 1000, f_range=(1, 50))
    powers[idx] = power
    
plot_spectra(freqs, powers, log_powers=True)    
plot_error_shade(freqs, powers, log_powers=True)
```
![shade](https://user-images.githubusercontent.com/34786005/110367925-29393300-7ffd-11eb-898a-33bbdf542e8e.png)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `083cc08f1677`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.