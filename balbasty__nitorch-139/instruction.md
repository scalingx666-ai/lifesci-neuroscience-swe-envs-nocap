# Issue

**Title:** FIX(register): LogAffine._switch_basis slices, 2D affine bases, Affine2dModel dat, Parameters.mul

## Description

## Summary

### 1. `_switch_basis` (first commit)

`_switch_basis(x, src, dst)` maps Lie parameters from one affine basis to another. It has two callers:
- `AffineModel.Parameters._switch`. With `-g/--progressive` it maps an optimiser step from the `optim` basis (rigid, then similitude) into the model basis (similitude or affine). This is the only caller that is reached.
- `LogAffine.switch_basis` / `AffineModel.switch_basis`. Nothing in the repo calls these.

What the function does: components that `src` and `dst` share are copied. When `dst` is larger, the rest is filled with zeros, so the transform is kept. When `dst` is smaller, the extra components are dropped, which is the orthogonal projection of the log-matrix. The similitude scale `s` stands for the zooms `(s, …, s)`. This is the convention `_optim_grad` uses: it sums the zoom gradients.

The condition flagged in #108 (`len(src_dat) >= dim + nb_prm` when the target is rigid) is a real bug. It was copied from the rotation branch, where `nb_prm` counts only the rotations. Because of it, similitude → rigid crashed in 3D. The 2D copy already had `>= nb_prm`. The CLI never reached it, because the progressive order never sends a step to a rigid target. The same audit found three more wrong slices, two of them only in the 2D copy:

| src → dst | 3D (master) | 2D (master) | fix |
|---|---|---|---|
| translation → any | ok | ok | – |
| rotation → translation | wrong: the rotation angles were returned as translations | wrong: returned a vector of length 1 | zeros |
| rotation → rotation/rigid/similitude/affine | ok | ok | – |
| rigid → translation/rotation (projection) | ok | ok | – |
| rigid → similitude/affine | ok (progressive path) | ok (progressive path) | – |
| similitude → translation/rotation | ok | ok | – |
| **similitude → rigid** | **crash** (`dim + nb_prm` condition) | ok | `len >= nb_prm` |
| similitude → affine | ok (progressive path) | **wrong**: the scale was also written into the shear, so the step no longer matched `_optim_grad` (`-2d … -g`) | write the scale into the `dim` zooms only |
| affine → translation/rotation/rigid | ok | ok | – |
| affine → similitude | ok (mean zoom) | **wrong**: the mean included the shear | mean of the `dim` zooms; the affine source is now tested explicitly |
| same → same | ok | ok | – |

The two `_switch_basis` copies now behave the same. A comment documents the convention.

### 2. Follow-ups found during the audit (second commit, approved by the maintainer)

- **`LogAffine2d('rotation').basis` crashed.** `_make_basis_2d` sent "rotation" down the rigid branch because the name starts with `r`. A rotation basis now has its own index for each plane: `[2]`, `[1]`, `[0]`.
- **2D affine basis for `plane=1`.** `idx = [0, 2, 1, 6, 8, 10]` used index 1, which is a translation along the out-of-plane axis, instead of index 4, the rotation in the plane. The fix is `[0, 2, 4, 6, 8, 10]`. Before the fix, `register @affine affine -2d 1` could not rotate. On a phantom rotated by 0.08 rad in plane 1, master is left with a linear error of 0.095 (identity would give 0.08). With the fix the error is 0.005.
- **`Affine2dModel.__init__`** passed `dat` positionally into the `optim` slot, so `dat` was dropped. Arguments are now passed by name. The plane and rotation are set *before* the parent `__init__`, because `set_dat` (called when `dat` is given) needs them. `ref_affine=None` no longer crashes on `None.to(...)`.
- **`AffineModel.Parameters.mul` / `mul_`** padded the factor with zeros through `_switch_basis`. With a parameter subset, they set the parameters that are not optimised to zero, and a scalar factor crashed. The factor is now padded with ones: `_switch(value - 1) + 1`, with a scalar expanded to the size of the optimised subset first.

## Not changed: needs a decision

The similitude basis itself (`spatial.affine_basis('similitude')`) uses the scale generator `I/sqrt(dim)`. `_switch_basis` and `_optim_grad` both treat `s` as zooms `(s, s, s)`. Optimisation is not affected, because the step and the gradient use the same convention. But `LogAffine.switch_basis` between similitude and affine does not keep the matrix: the zoom is off by a factor of `sqrt(dim)`, or `sqrt(3)` for the embedded 2D basis `diag(1,1,0)/sqrt(3)`. Nothing calls it today. Options:
1. Keep `_switch_basis` as the step map. Make `switch_basis` exact by projecting with the actual basis matrices (e.g. `spatial.switch_basis(..., ortho=True)`) or with `affine_parameters`.
2. Make `_switch_basis` keep the transform (`z = s/sqrt(dim)`, `s = sum(z)/sqrt(dim)`). `_optim_grad` then has to scale its zoom-gradient sum the same way, with the `sqrt(3)` case for `LogAffine2d`.

A test marks this as `xfail(strict=True)`.

## Tests

New file `nitorch/tests/test_register_switch_basis.py` (about 5 s):
- `test_switch_basis[src-dst-dim]`: all 25 pairs, in 2D and 3D. It uses `spatial.affine_basis` generators, with the similitude scale taken as the sum of the zoom generators. When `dst ⊇ src`, the two exponentiated log-matrices agree to 1e-10. Otherwise the result equals the least-squares projection of the log-matrix onto the `dst` generators, to 1e-10.
- `test_switch_basis_2d_copy`: `LogAffine2d._switch_basis` gives the same result as `LogAffine._switch_basis(..., dim=2)`.
- `test_switch_basis_matches_optim_grad`: `<_optim_grad(g), d> == <g, _switch_basis(d, optim, basis)>` for every pair with optim ⊂ basis, in 2D and 3D.
- `test_logaffine2d_basis[name-plane]`: every `LogAffine2d` basis, for every plane, equals the 2D generators embedded in that plane. The similitude scale is checked against `diag(1,1,0)/sqrt(3)`.
- `test_affine2d_model_dat`: `Affine2dModel(..., dat=x)` keeps `x` and leaves `optim` as `None`.
- `test_affine_parameters_mul[scalar/vector]`: `mul` and `mul_` with `optim='translation'` in a rigid basis scale the translations and leave the rotations alone.
- `test_switch_basis_similitude_keeps_matrix`: strict xfail, see above.

Results (CPU, TS backend):
- On master: 15 failed (8 from `_switch_basis`, plus rotation basis ×3, plane-1 affine, `Affine2dModel` dat, and `mul` ×2).
- With this PR: 111 passed, 1 xfailed.
- Fast set `nitorch/tests/test_register_*.py`: 422 passed, 17 skipped, 1 xfailed.
- Smoke runs on the `test_register_optim` phantom with `register @loss mse` and the default pyramid:
  - `@affine {similitude,affine} -g [-2d 2]`: error below 0.003 on the linear part and below 0.005 mm on the shift. 3D gives the same numbers as master.
  - `@affine {rigid,affine,affine -g} -2d 1`: linear error at most 0.0055 (master `affine -2d 1`: 0.095).

Part of #114

🤖 Generated with [Claude Code](https://claude.com/claude-code)

https://claude.ai/code/session_01MHwEa9dAf8MwawzzozKLzE

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `330888497079`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.