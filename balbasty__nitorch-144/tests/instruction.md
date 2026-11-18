# Issue

**Title:** FIX(register): normalise the MI joint histogram by its mass (empty overlap is the worst value)

## Description

## Problem

`test_register_optim.py::test_affreg_default` and `test_register_powell.py::test_affreg_default_recovers_rigid` (slow tests) fail on master since #138 ("Guard degenerate histogram ranges").

`nitorch affreg` uses NMI with Powell, whose line searches probe transforms that move the moving image entirely out of the field of view (empty overlap mask). Before #138 these evaluations were NaN and rejected; since #138 they are finite but spuriously **good** (1 − NMI = 0.376, vs 0.633 at the best real alignment), so Powell drifted out of the FOV (z translation of −877 mm on the test pair).

## Root cause

`mi()` divided the clamped joint histogram by the number of masked voxels, which was forced to 1 for an empty mask (to avoid NaNs). The clamped histogram (`1e-8` in every bin) was then not a distribution: its total is `bins²·1e-8`, and its entropies give 1 − NMI = `2·log(bins)/18.42` (= 0.376 for 32 bins) instead of 1.

## Fix

Normalise the clamped histogram by its own mass instead of by the voxel count. No detection of degenerate cases (empty mask, flat images):
- an empty overlap gives a uniform histogram, and a constant image a separable one: both have exactly zero mutual information, i.e. the worst value of every normalisation (1 − NMI = 1, −MI = 0), and a constant histogram gradient, hence ~zero voxel gradient;
- otherwise the mass equals the voxel count (up to the clamp), so values are unchanged.

`entropy()` gets the same normalisation. The gradient includes the projection term of the normalisation (`g -= sum(g·p)`), which matters when histogram smoothing (fwhm > 0) loses mass at the edges.

The first commit (detection of degenerate batch elements) is superseded by the second one; the final diff is the normalisation only.

## Tests

- `test_mi_no_information_is_worst`: empty mask, constant moving, constant fixed, constant within the mask, for each normalisation. Degenerate channels have the worst value (atol 1e-6) and gradient/Hessian ≤ 1e-6 × the healthy channel's (not exactly 0, because the `1e-8` clamp makes the histogram only nearly separable); healthy channels are unchanged.
- `test_mi_value` and `per_slice_reference` (in `test_register_mi_hess.py`) normalise their references by the histogram mass.
- `test_mi_hess_is_abs_newton_term`: tolerance 30×TOL (was 10×TOL) when fwhm > 0, because the Hessian omits a cross term from the normalisation (zero when fwhm = 0). Adding the term makes all cases pass at the original tolerance, at the cost of two extra backward passes.
- `pytest nitorch/tests/test_register_*.py --runslow`: 733 passed, 1 xfailed (master: 2 failed, the affreg tests above).
- Merged with current master (#148): MI, MI-Hessian, hist-Hessian-order and both affreg tests pass (114 passed).

Tracked in #114.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

https://claude.ai/code/session_01MHwEa98YiGFLmB3ZnwKzoe

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e60f9e4ae067`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.