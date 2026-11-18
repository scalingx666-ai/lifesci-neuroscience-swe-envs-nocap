# Issue

**Title:** fix: prevent MilsteinGradFree OOM crash; make GPU test suite hardware-independent

## Description

## Summary

Fixes the `test_linux` CI failure and makes the test suite pass on GPU developer machines without changing CPU/CI behaviour.

### The crash (primary fix)

`test_linux (3.13)` was OOM-killed (`exit code 143`) at
`brainpy/integrators/sde/normal_coverage_test.py` **[69%]**.

**Root cause:** the vector-Wiener branch of `MilsteinGradFree.step` used the full
`(m, m)` diffusion-bar matrix together with `minus * jnp.sum(noise_p2, -1)`,
leaving the noise dimension inside the integrated state. Each step grew the
output by two axes — `()` → `(m, m)` → `(m, m, m, m)` → … — a multi-GB blow-up
over a long integration that exhausted the runner's RAM. macOS/Windows runners
had enough headroom to survive (4055 passed), so only Linux crashed.

**Fix:** take the diagonal of the diffusion-bar block and contract the
per-component Milstein correction over the noise axis, mirroring the
shape-preserving pattern already used by `Milstein`. The integrated state now
stays correctly shaped; a full single-process run of `brainpy/` peaks at a
bounded **~9 GB** with the crash region flat (no spike) and reaches 100%.

### Hardware-independent test suite (GPU portability)

- **conftest.py** — pin `jax_default_matmul_precision='highest'`. On NVIDIA GPUs
  the default uses TF32 for `float32` matmuls (~1e-4 relative error), which broke
  operator-vs-dense correctness comparisons (JIT-connectivity layers,
  orthonormality checks) on GPU while passing on CPU. No effect on CPU/CI (already
  full `float32`).
- **brainpy/dnn/linear_test.py** — float32-appropriate tolerances
  (`rtol=1e-4, atol=1e-5`) for the JIT-operator vs dense `x @ conn` comparison;
  the default `atol=1e-8` is tighter than float32 rounding for the near-zero
  symmetric-uniform outputs.
- **brainpy/math/object_transform/object_transform_fixes_test.py** — guard the
  `.cuda()` / `.tpu()` `RuntimeError` assertions on device availability so the
  test stays meaningful on CPU-only CI yet does not fail on GPU/TPU machines.

## Testing

- Full single-process `pytest brainpy/` run (GPU, CI-equivalent): **4061 passed,
  14 skipped**, no crash, bounded ~9 GB peak. (The only local failures were in
  `surrogate`/`l1_loss` tests, which are artifacts of a pinned `braintools<0.2.0`
  dev env; CI uses `braintools>=0.2.0` where they pass — macOS and Windows jobs
  are green.)
- Verified `MilsteinGradFree` now produces correctly-shaped (non-exploding)
  output for the vector-Wiener Ito case.

### Dependency fix (unblocks CI install)

`braintools 0.2.0` was **yanked from PyPI**, so the existing `braintools>=0.2.0`
pin became unsatisfiable and `pip install -r requirements.txt` failed on every
runner (~10 s, before any test ran). Bumped the pin to **`braintools>=0.3.0`**
(the next released version, which carries the surrogate / metric fixes the
`brainpy.math.surrogate` and L1-loss tests assert) in both `requirements.txt`
and `pyproject.toml`. Verified locally with braintools 0.3.0: the surrogate +
L1-loss tests that were red under the yanked-version fallback (0.1.10) now pass
(102 passed).

### Cleanup: reuse `brainunit.math` einops (drop the local port)

`brainpy.math`'s `ein_reduce` / `ein_rearrange` / `ein_repeat` / `ein_shape`
duplicated an einops implementation that now lives in `brainunit.math`
(`einreduce` / `einrearrange` / `einrepeat` / `einshape` — behaviour-identical
and accepting brainpy `Array` instances directly, verified). The historical
`ein_*` names are now thin aliases re-exported from `brainunit.math`, and the
duplicated implementation (`einops.py`, `einops_parsing.py`) plus its dedicated
tests (`einops_test.py`, `einops_coverage_test.py`, `einops_parsing_test.py`)
are removed. The einops tests in `math_compat_fixes_test.py` now exercise the
public `bm.ein_*` aliases and assert the re-export wiring (87 passed locally).

### Cleanup: remove taichi / tifunc remnants

The taichi backend is gone; this drops the fully-skipped `tifunc_test.py`
(a taichi `ti.kernel` test) and the stale `method` / Taichi paragraph in the
`csrmv` docstring (that parameter no longer exists — `csrmv` dispatches through
`brainevent`).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a1d96a266975`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.