# Issue

**Title:** Release 0.2.1

## Description

This PR bumps the version to 0.2.1 and adds the changelog entry documenting all changes merged to master since v0.2.0.

**What's in this release**

**Bug fixes**
  - `higuchi_fd`: off-by-one in the inner loop — summed N_m - 1 differences per sub-series instead of N_m, causing a systematic underestimate of curve length.
  - `sample_entropy`: returns `np.nan` (was 0) when no template of length m matches within tolerance — entropy is undefined in that case, not zero.
  - epsilon = 10e-9 → 1e-9 in `utils.py` (silent 10× error in the DFA linear regression guard).
  - `all = [...]` → `__all__ = [...]` in all three source modules — previously leaked np, jit, KDTree, etc. into the public namespace on `from antropy import *`.

**New feature**
  - `hjorth_params(sf=None)`: optional sampling frequency parameter converts mobility from samples⁻¹ to Hz.

**Docs**
  - Corrected `higuchi_fd` docstring formula to match the fix above.
  - Added clarifying notes to `lziv_complexity`, `num_zerocross`, `spectral_entropy`, `detrended_fluctuation`, and `hjorth_params`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e6581bbf552a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.