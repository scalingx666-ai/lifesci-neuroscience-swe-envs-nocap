# Issue

**Title:** Fix GMM thresholding and NMF reproducibility

## Description

## Summary

- **`fit_gaussian_mixture`: GMM convergence.** The default `tol` is now 1e-10. With sklearn's default 1e-3, EM stopped after a few iterations before converging, and network thresholds changed by up to 3 percentiles between runs. `gmm_time_courses` keeps `tol=1e-3`, so the GMM on DyNeMo alphas stays fast.
- **`fit_gaussian_mixture`: `p_value`.** Fixes a crash with recent numpy.
- **`gmm_threshold`:** passes `mean_weights` on to `threshold`.
- **`fit_gmm`:** with `keep_positive_only`, the percentile is computed over all edges.
- **`decompose_spectra`:** defaults to `random_state=0`, so results are reproducible.

## Checks

- **Network thresholds:** with the GMM run to convergence, thresholds and edges match an independent implementation (SPM HMM toolbox) to 1e-14.
- **DyNeMo alphas:** on real alphas (OSF project by2tc), the converged fit agrees with a long run on 99% of samples, against 94% before. That fit takes about 80 s against 5 s, which is why `gmm_time_courses` keeps the faster setting.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fa4b28a5f758`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.