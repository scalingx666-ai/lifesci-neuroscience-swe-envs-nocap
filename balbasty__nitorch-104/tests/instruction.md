# Issue

**Title:** FIX(register): normalise GMM loss by voxel count only once

## Description

## Summary
- `em_loop` already divides the GMM nll by the voxel count, and `_fit_gmm2` (in `losses/utils_gmm2.py`) then divided it a second time. That made the `GMMH` value about N times too small compared with its own gradient and Hessian, which were already normalised per voxel, and compared with the regulariser. The second division is removed.
- The `update='m'` branch never normalised its nll, so it now divides by the voxel count once. This makes the value scale the same way as in MSE and NMI: the value is a voxel average, and the gradient and Hessian are per voxel divided by N.
- Local GMM (`lgmmh` / `fit_lgmm2`): **verified correct**, no code change. The value is a voxel mean (`logsumexp(...).mean()`), and the gradient and Hessian are each divided by `nvox` once. Tests were added so it stays covered.
- The regularisation is not touched.

## Tests
`nitorch/tests/test_register_gmm.py` has 6 tests.

**GMMH** (all 4 fail on master and pass with this fix):
- The value matches an independently computed mean negative log-likelihood under the fitted parameters.
- **Scaling:** repeating every voxel 2x2 keeps the value the same and divides the voxel-wise gradient and Hessian by 4.
- **Finite differences, gradient:** cosine > 0.999 and the norm ratio is within 2% of 1.
- **Finite differences, Hessian:** the diagonal (Fisher-scoring approximation) has the right magnitude, within a factor of 2.
- `GMMH.loss` gives the same value as `loss_grad_hess`.

**LGMMH** (both pass on master):
- **Scaling:** 2x2 repeat with the patch size doubled keeps the value, the total |gradient| and the total Hessian the same, each within 2%.
- **Finite differences, gradient:** cosine > 0.95 and norm ratio between 0.8 and 1.25. The measured values are cosine about 0.97 and ratio about 1.10. The tolerance is loose because the analytic gradient treats the local GMM parameters as fixed.
- **Finite differences, Hessian:** within a factor of about 2.5.
- There is no independent-value test for the local model: rebuilding its smoothed local log-likelihood would just repeat `e_step_local`, so the scaling test is used to check the value instead.

## Found, not fixed here
- The `lgmmh` gradient is only approximate: cosine about 0.97 against finite differences, because the local parameters are treated as fixed. This is a modelling approximation, not a normalisation bug.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

https://claude.ai/code/session_01MHwEa9dAf8MwawzzozKLzE

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d5fcdacba50d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.