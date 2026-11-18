# Issue

**Title:** FIX(register): fast GMM tests, NaN-safe EM early stop, LGMM coverage

## Description

## Summary
- **Slow FD test (not a hang).** `_fit_gmm2` / `em_loop` cannot run forever: the only loop is `for nit in range(max_iter)`. `test_gmm_grad_hess_fd` made about 400 `gmmh` calls, each running up to 128 EM iterations: 476 s locally. The test now fits once and runs every finite-difference evaluation at the fitted parameters with `max_iter=0`, on a seeded 8x8 image. It also checks more strictly than before: cosine > 0.99999 and gradient norm ratio within 1%.
- **EM early stop.** The convergence ratio in `em_loop` is 0/0 = NaN when EM is warm-started at an exact fixed point, so EM ran all `max_iter` iterations (500 iterations: 11.3 s, now 0.05 s). Changes:
  - the denominator is guarded;
  - EM stops if the gain is not finite;
  - EM also stops when the absolute change is negligible (`< 1e-9 * (1 + |nll|)`).
- **Seed 2, 32 vs 128 iterations: slow convergence, not oscillation.**
- **`em_loop_local` convergence.** It now uses the same guarded criterion. When started from responsibilities (the default), `nll_max` was +inf, so **LGMM always stopped after 2 EM iterations**. It now converges properly, which can change `LGMMH` results and runtime.
- **Masked GMM fit returned NaN.** The NaN first appears in the initial parameters from `init_gmm2`, for two reasons:
  1. `init_gmm2` indexed `x`, `y` and `mask` with `[..., 0]`. It expected a trailing class axis that its only caller never adds, so it dropped the last *spatial* axis: quantiles came from a single slice, which happened to be masked out.
  2. `utils.quantile(..., mask=)` lets masked-out values leak into the extreme quantiles. q=0 gives NaN when the smallest values are masked out, and q=1 picks up masked-out values.

  The initial quantiles are now computed on in-mask voxels only. `em_loop` also passes `mask` to its first `e_step` call.
- **Local GMM coverage.** `lgmmh` normalisation was **verified correct**: value, gradient and Hessian are each divided by the voxel count once. Cherry-picked from `claude/bugfix/register-gmm-scaling`.

## Tests
`nitorch/tests/test_register_gmm.py`: 8 passed in about 72 s locally (previously 488 s for 4 tests).
- `test_gmm_grad_hess_fd`: about 7 s (was 476 s).
- `test_gmm_em_stops_at_fixed_point`: warm-starts at a fixed point; 500 iterations must cost about the same as 1. Fails on master.
- `test_gmm_masked_fit_ignores_masked_voxels`: outliers placed in the masked-out region. Value, gradient and Hessian equal those of the cropped in-mask fit (to about 1e-14), and the gradient and Hessian are exactly 0 outside the mask. Fails on master (NaN).
- The LGMM scaling test and the directional FD test use seeded small images and `max_iter=8`.

Note on #121: it marks `test_gmm_grad_hess_fd` with `@pytest.mark.slow`. This PR leaves that marker off. The test now takes about 7–9 s locally, so #121's marker on it can be dropped or kept; that's your call.

## Found, not fixed here
- **`nitorch.core.utils.quantile(..., mask=)` is still wrong** in the extreme quantiles, as described above. It was only bypassed in `init_gmm2`; other callers may be affected.
- Each EM iteration is slow for tiny images (about 25 ms for 100 voxels, probably TorchScript overhead).
- A warm start that is near, but not exactly at, the fixed point still runs a long tail of iterations. The absolute tolerance limits this.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

https://claude.ai/code/session_01MHwEa9dAf8MwawzzozKLzE

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0746392d0d36`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.