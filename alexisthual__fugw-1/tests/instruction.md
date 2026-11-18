# Issue

**Title:** add mm algo and optimise code and allow FGW

## Description

Major revision of FUGW solver:
- Add MM algo to the solver.
- Optimize code: optimize memory usage during the minimization, restructure and simplify code to improve the readability and ease of maintenance.
- Allow to use unregularized fused GW (but require additional dependency on POT library `version >= 0.8.2`).

All supported modes are:
- Unregularised and regularised (balanced) fused GW (`rho_x = rho_y = inf`).
- Regularized semi-relaxed fused GW (`eps > 0` and `rho_x < inf` and `rho_y = inf`).
- Unregularised and regularised (truly) unbalanced fused GW (`rho_x, rho_y < inf`).

Unsupported modes are:
- Unregularized semi-relaxed Fused GW (`eps = 0` and `rho_x < inf` and `rho_y = inf`).

**Only the solver is tested but not the whole package with `pip install fugw`**

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `73e92b84c56f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.