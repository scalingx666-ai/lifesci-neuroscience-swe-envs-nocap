# Issue

**Title:** Fixes for spectral/covariance calculations

## Description

Changes:
- Fixed cross spectra calculations.
- Tested covariance calculated from the data matches that calculated directly from the time series data.
- Updated the docs.

Tested the code with:
```
import numpy as np
from osl_dynamics.data.processing import standardize
from osl_dynamics.analysis import static, power, connectivity
from osl_dynamics.data import Data

n_channels = 5
fs = 50

m = np.zeros(n_channels)
W = np.random.normal(size=[n_channels, n_channels])
C = W @ W.T + 1e-5 * np.eye(n_channels)

X = np.random.multivariate_normal(m, C, size=20000)

data = Data(X, sampling_frequency=fs)

f, psd = static.welch_spectra(X, sampling_frequency=fs, window_length=500, standardize=False)
p = power.variance_from_spectra(f, psd, method='integral', frequency_range=[10, 12])

f, cpsd = static.welch_spectra(X, sampling_frequency=fs, window_length=500, standardize=False, calc_cpsd=True)
c = connectivity.covariance_from_spectra(f, cpsd, frequency_range=[10, 12])

data.filter(low_freq=10, high_freq=12)
X = data.time_series()
cov = np.cov(X.T)

print("original:", np.diagonal(cov))
print("from psd:", p)

print("original:")
print(cov)
print("from cpsd:")
print(c)
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `654cbc95bb43`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.