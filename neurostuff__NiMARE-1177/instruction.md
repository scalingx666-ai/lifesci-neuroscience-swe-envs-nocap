# Issue

**Title:** [ENH] Run NiMARE in the browser: lazy imports and a 32-bit np.repeat fix

## Description

## Summary

NiMARE can now run entirely in the browser (JupyterLite with the xeus-python kernel), using emscripten-forge's WebAssembly builds of numba, scipy and scikit-learn. Two things were in the way. Coordinate-based estimators crashed on 32-bit platforms, and `import nimare` imported about 3,000 modules up front.

### 1. Fix `np.repeat` on 32-bit platforms
The studyset store keeps CSR offsets as int64. `np.repeat` safe-casts its counts to `intp`, which is int32 on wasm32, so every CBMA estimator failed with `Cannot cast array data from dtype('int64') to dtype('int32')`. The counts are now cast to `np.intp`: the studyset call sites go through one helper, `layout.sizes_from_offsets`, and GCLDA casts its token counts. On 64-bit platforms the casts are no-ops.

### 2. Lazy imports (`lazy_loader`)
- `nimare` and `nimare.meta` resolve submodules and estimators on first access, via `lazy_loader.attach`. `nimare.meta.ALE`, `from nimare.meta import Stouffers` and `from nimare import *` all work as before, and `EAGER_IMPORT=1` restores eager loading.
- `nimare.utils` imports torch only inside `seed_torch`.
- `nimare.transforms` imports PyMARE only in `chi2_to_nlogp`'s general-dof branch, so ALE/MKDA/KDA don't load PyMARE or SymPy.
- The nilearn version check reads package metadata instead of importing nilearn.
- fuzzywuzzy's import-time warning used to be hidden by the blanket `catch_warnings` around the eager imports. It's now filtered where fuzzywuzzy is imported.
- New dependency: `lazy_loader>=0.4`. It's pure Python and on PyPI and conda-forge.

### 3. Request float64 `finfo` first (Windows)
`nimare/__init__.py` calls `np.finfo(np.float64)` before anything else is imported. Since NumPy 2.4, on Windows, `finfo` caches `longdouble` and `float64` as the same entry. nibabel requests `longdouble` when imported, so once the eager imports were gone, statsmodels' GLM started producing `longdouble` arrays and the CBMR statsmodels-oracle tests failed. The eager imports used to request `float64` first by accident. Reported upstream as numpy/numpy#32947.

### Effect
| | before | after |
|---|---|---|
| native `import nimare` | ~6 s | ~0.1 s |
| native `from nimare.meta.cbma import ALE` | ~6 s (all of `import nimare`) | ~2.5 s, 2,530 modules |
| browser `import nimare` (bytecode shipped) | 29 s | 0.07 s |
| browser `+ from nimare.meta.cbma import ALE` | (included above) | 17–22 s |

These are single runs, except the browser ALE path, which is three. Browser numbers vary by about 30% between runs.

## Testing
- Full suite: 1794 passed, 3 failed. All three are environmental and also happen without this change. Two combination tests need PyMARE ≥ 0.0.11, and the test environment had an older local checkout; with 0.0.13 they pass. The memory-budget test in `test_ml.py` reads `ru_maxrss`, which is the process's peak over the whole session, so in a full run it counts memory used by earlier tests; on its own it passes.
- In the browser, IBMA (Stouffer's, DerSimonian-Laird), ALE and MKDA with Monte Carlo FWE, and Jackknife all ran. Their values match native runs with the same PyMARE version.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Summary by Sourcery

Enable efficient browser-compatible NiMARE imports and reliable coordinate-based analyses on 32-bit platforms.

Bug Fixes:
- Fix coordinate-based estimators on 32-bit platforms by making repeated-element counts compatible with the platform index type.

Enhancements:
- Make NiMARE and its meta-analysis estimators load submodules and optional dependencies on demand, substantially reducing import time and enabling browser-based execution.
- Defer optional torch, PyMARE, and nilearn imports and handle the fuzzywuzzy warning locally to avoid unnecessary import-time work and noise.

Build:
- Add lazy_loader as a runtime dependency.

Tests:
- Add fresh-interpreter import tests covering lightweight top-level imports and dependency isolation for coordinate-based estimators.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6e8229dc5c8f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.