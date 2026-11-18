# Issue

**Title:** FIX(register): robust IRLS weights, l1/l2 aliases

## Description

## Summary
- `losses/robust.py`: when the IRLS log-weight term was computed, it called `weights.reciprocal_()` in place. That inverted the weights later used in `lam * weights`, so outliers got the most weight in MAD and Tukey. It now uses an out-of-place reciprocal.
- `losses/robust.py`: when lam is estimated and there is no mask, the IRLS path crashed because the int `mask=1` was passed to `weighted_precision` as `weights`. It now passes `None` in that case.
- `losses/robust.py`: the Tukey loss value is now exact. The term added to the weighted MSE now depends on the loss: each subclass has its own `dual(weights, **prm)`. MAD keeps `1/(2w)`. Tukey uses `phi(w) = c²/6 (1 - 3w + 2w^{3/2})`, so the loss value equals Tukey's rho (`c²/6` for |r| ≥ c). The gradient and Hessian are unchanged.
- `register/parser.py`: `l1` mapped to `mse` and `l2` mapped to `mad`. They are swapped so `l1` gives `mad` and `l2` gives `mse`. This now matches the help text and `pairwise_makeobj`.

## Tests
New file `nitorch/tests/test_register_robust.py`:
- MAD and Tukey, with fixed lam and with estimated lam: outliers are downweighted and their gradient is bounded.
- MAD: the gradient matches central finite differences, equals `sign(r)/nvox`, and the value equals `sqrt(lam)|r|`.
- Tukey: the gradient equals psi, the value equals rho for r in [0, 2c] (lam = 1 and lam = 4), and the value's finite differences match the gradient.
- CLI alias mapping for `l1`, `l2`, `mad` and `mse`.

Results: 41 passed, together with `test_register_parser.py` and `test_register_mi.py`.

## Found, not fixed here
- When lam is estimated, the IRLS branch's `lll` term (`-0.5 * sum(w * log lam)`) and its use of weights computed with the previous lam are only an approximation of the joint objective. This PR does not change them.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

https://claude.ai/code/session_01MHwEa9dAf8MwawzzozKLzE

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d5fcdacba50d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.