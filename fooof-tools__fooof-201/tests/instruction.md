# Issue

**Title:** [ENH] Optimization

## Description

Addresses a point in #193. This adds minor tweaks to speed up fitting. The most noticeable difference is when using `fit_fooof_3d`. 56% faster for a (100, 10, 99) array:
```python
import numpy as np

from fooof import FOOOFGroup
from fooof.objs import fit_fooof_3d
from fooof.sim import gen_group_power_spectra

np.random.seed(0)

ap_params = [-2, 0]
pe_params = [[10, 5, 5], [25, 5, 5]]

freqs, powers = gen_group_power_spectra(10, (1, 50), ap_params, pe_params)

# Shape: (100, 10, 99)
powers_3d = np.array([powers] * 100)

fg = FOOOFGroup(verbose=False)
```
```python
%%timeit
fgs = fit_fooof_3d(fg, freqs, powers_3d, n_jobs=4)
```
Before:

> 3.56 s ± 20.7 ms per loop (mean ± std. dev. of 7 runs, 1 loop each)

After:
> 2 s ± 19.7 ms per loop (mean ± std. dev. of 7 runs, 1 loop each)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f81ee126cbff`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.