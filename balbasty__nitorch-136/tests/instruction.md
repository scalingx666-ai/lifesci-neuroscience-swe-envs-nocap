# Issue

**Title:** ENH(register): GMM losses as mutual information; faster; float32 NaN fix

## Description

## Summary

Changes to the Gaussian-mixture registration losses (`nitorch/tools/registration/losses/gmm.py`, `utils_gmm2.py`).

### Mutual information instead of joint entropy

The GMM losses minimised the joint entropy H(mov, fix) of a fitted 2D Gaussian mixture. On its own, joint entropy can be decreased by making the warped moving image more uniform (shrinking it into the background, expanding flat regions), irrespective of the fixed image. It is also not invariant to the moving intensity scale.

**Python API.** New option `measure` for `gmmh`, `lgmmh`, `GMMH`, `LGMMH`:
- `'mi'` (default): H(mov, fix) − H(mov), i.e. minus the mutual information. The fixed image is never warped (symmetric losses permute the images), so the constant H(fix) is dropped.
  - Marginals are taken from the fitted joint mixture.
  - With one class it is equivalent to the correlation coefficient (local version: LCC-like).
  - Gauss-Newton Hessian: corr² / (var_mov · (1 − corr²)), exact for one class.
- `'joint'`: previous behaviour.

**Command line.** Only the mutual-information version is exposed, as `@loss gmmi` / `@loss lgmmi` (Gaussian Mixture Mutual Information). `gmm` / `lgmm` remain as aliases. There is no `--measure` option.

Also:
- gradients are now the exact derivatives of the value at fixed mixture parameters;
- the LGMM Hessian no longer vanishes with one class.

On a multimodal phantom with a known warp (nonlinear `svf`), the residual misalignment was 0.036 with MI vs 0.095 with joint entropy (and 0.104 with histogram MI). That was measured before the singleton-axis / mean-space fixes in #142 and #143, on a thin-slab phantom.

### Performance (device-agnostic: fewer passes, buffer reuse, fewer EM iterations)

- `LGMMH` warm-starts EM from the previous fit, guarded by image shape, patch and number of classes. It was always cold-started.
- Stride-1 transposed local means are computed as convolutions (same operator, ~4× faster than `conv_transpose`; also benefits LCC). The normalisation map is cached.
- One local mean per M-step and per value/grad/Hessian evaluation, using a buffer reused across EM iterations.
- Global M-step: a single (chunked, double-accumulated) matrix product. E-steps: in place, with a single exponentiation.
- `GMMH` passed its cached parameters to the fit, which consumed them, so the state restored after line searches was empty and EM cold-started each time. It now passes a copy.

Per registration iteration: GMM 96³ 1.6 → 0.5 s, LGMM 32³ 11.7 → 2.8 s (float32, 4 CPU threads).

### Fixes and defaults

- **float32 NaN:** with more classes than tissues, empty classes underflowed in float32 and gave 0/0 = NaN. A weak prior (1e-8 of the pooled statistics) makes them revert to global/local statistics.
- **Defaults:** `gmmi` keeps 6 classes; `lgmmi` now uses 3 by default (6 is a lot for a patch). `lgmmh` uses patch 20, as `LGMMH`. Docstrings fixed.
- Fixed the covariance recovered when the fit starts from responsibilities.

## Not included / caveats

- **EM iteration cap:** an experiment suggested capping warm-started EM at ~4 iterations (with a converged first fit at each pyramid level), for 2–4× speed-ups at equal accuracy. It ran before the fixes in #142 / #143 and should be re-checked, so it is not implemented here.
- **Masks:** `LGMMH` still ignores masks.
- **Square kernel:** the backward pass of the square-kernel local mean is broken (pre-existing); documented by a strict `xfail` test.
- **Synthetic data:** on SynthMorph-like 2D pairs (independent per-label contrasts, Perlin textures, bias fields), all intensity-based multimodal losses barely improve Dice (≤ 0.57 from 0.52, vs 0.95 for a label oracle). `lgmmi` is the best of them (0.566), ahead of histogram NMI (0.55) and `gmmi` (0.52). Diagnostics show the losses' optima are not the true transform on such data (they fit independent textures/bias), so a bias-field-aware GMM would be a natural next step.

## Tests

- New/updated tests in `nitorch/tests/test_register_gmm.py`:
  - value/gradient/Hessian for each measure (exact FD at fixed parameters);
  - scaling invariance and non-degeneracy;
  - masks, warm starts, state restore;
  - float32 with more classes than tissues;
  - local-mean adjointness and chunked sums.
- CLI tests in `test_register_options.py` / `test_register_parser.py`: `gmmi`/`lgmmi` and their aliases build MI losses with the documented defaults; `-m` is rejected.
- `pytest nitorch/tests/test_register_*.py`: 699 passed, 18 skipped, 1 xfailed.
- With `--runslow`, two affine-registration tests (`test_register_optim.py::test_affreg_default`, `test_register_powell.py::test_affreg_default_recovers_rigid`) fail, as they do on current master.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

https://claude.ai/code/session_014dBjaVf62L1EXi9GATc5cD

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7cc8c35fafb8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.