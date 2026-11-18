# Issue

**Title:** FIX(register): push SVF gradients with the forward boundary condition

## Description

## Summary

Part of #114.

In `do_vel`, the forward pass samples the exponentiated displacement at the fixed voxels with `bound='zero'`, so the displacement is zero outside the field of view (FOV) of the nonlinear lattice. `SVFModel.propagate_grad` pushed the gradient back to that lattice with `bound='dft'`. As a result, the gradient from fixed voxels outside the nonlinear FOV wrapped around onto the opposite side of the field. The push now uses `bound='zero', extrapolate=True`, the same settings as the forward pull. The change is one line in `SVFModel.propagate_grad`.

When the fixed lattice is the nonlinear lattice (`right is None`), nothing is pushed and the results are bitwise unchanged. I checked this for the forward and the symmetric loss. With a rigid affine on the fixed side, `right` is not `None` and the result changes, as it should.

**This fixes only the boundary part of #114.** In the 2 mm field on 1 mm images case from #111, the main error comes from somewhere else (see "Found, not fixed here").

### Measurements

Setup: brain-like phantom, 96³ at 1.67 mm (CPU; reduced from 128³ for runtime). The moving image is the fixed image warped by a known smooth deformation plus a small rigid transform. MSE loss, evaluated at a random smooth velocity of about 1.5 voxels. The reference gradient is autograd through a copy of the `do_vel` forward pass; it agrees with directional finite differences (FD) to about 3e-4. "Border" means within 3 nonlinear voxels of the edge of the field.

| case | lattices | cos (all) master → this PR | cos (border) master → this PR | cos (interior) master → this PR | with the prototype below (all) |
|---|---|---|---|---|---|
| a | everything on the same 96³ lattice | 0.998 → 0.998 (bitwise) | 0.999 → 0.999 | 0.998 → 0.998 | 0.998 |
| b | field `-v 3.33` (2× the image voxel), mean space 49³ | 0.920 → 0.920 | 0.977 → 0.977 | 0.920 → 0.920 | **0.998** |
| c | moving rotated by 8° in its header, 1.04× voxel size, rigid affine, default mean space | 0.936 → 0.936 | 0.721 → 0.721 | 0.936 → 0.936 | **0.998** |
| d | moving is a z-slab, `-f mov` (fixed extends past the field) | 0.846 → **0.997** | 0.283 → **0.997** | 0.905 → **0.997** | 0.998 |

Directional FD on 12³ random-texture images. The table shows the analytic derivative divided by the FD derivative, along the gradient direction:

| field lattice | SVF master | SVF this PR | smalldef | shoot (master, regularisation ≈ 0) |
|---|---|---|---|---|
| same | 1.002 | 1.002 | 1.000 | 1.013 |
| 4 fewer slices, integer shift | 1.822 | **1.005** | 1.000 | 1.391 |
| 4 fewer slices, half-voxel shift | 2.386 | 1.571 | 1.721 | 1.293 |
| 2 mm field on 1 mm images | 10.57 | 10.57 | 11.45 | 3.35 |

End-to-end runs (`register @loss mse @affine rigid @nonlin svf`, 48³ at 3.3 mm, CLI defaults): on case d, this PR and master end with the same loss (4.16e-3 vs 4.06e-3) and the same mean deformation error (2.40 vs 2.35 mm). A 3 mm shift is close to the image voxel size, so a gradient error confined to the border band does not show up at this scale. I have not measured how much it matters at 1 mm.

## Tests

`nitorch/tests/test_register_svf_grad.py` (12³ images, about 2 s):

- `test_vel_grad_smaller_fov[shape0|shape1]`: the nonlinear FOV is smaller than the fixed image, with the same voxel size and an integer shift. The test checks directional FD along the gradient and 3 smooth random directions, |fd − an| < 0.05·‖g‖. **Fails on master** (along the gradient: FD 1.96e-5 vs analytic 3.58e-5), passes here.
- `test_vel_grad_coarser_field`: 2 mm field on 1 mm images. It is marked `xfail(strict=True)` because it is not fixed here (along the gradient: FD 1.2e-5 vs analytic 1.28e-4). It passes with the prototype below; remove the marker when that change lands.

`test_register_symmetric.py` and the other `test_register_*.py` files all pass (90 passed, 1 xfailed).

## Found, not fixed here

- **Main cause of the mismatched-lattice SVF gradient error (cases b and c, and the #111 numbers).** `propagate_grad` pushes the *scalar* loss gradient `g` to the nonlinear lattice. Only then does it multiply by the moving-image gradient, which is sampled at the *nodes* of that lattice (`moving.pull_grad(phi_left)` on `self.shape`). This is exact only when every fixed voxel falls on a node. Otherwise ∇m is taken up to one field voxel away from where the sample actually is. On a coarser field this makes the analytic gradient up to 10× too large along its own direction, in the interior as well as at the border.

  Proposed change, local to `SVFModel.propagate_grad` and only on the `right is not None` branch, with the interface unchanged (`do_vel` still applies `jg`/`jhj`):
  1. Build the full forward grid on the fixed lattice (pull `phi` at `right` with `bound='zero'`, add `right`, apply `left`).
  2. Compute `mugrad = left^T ∇m` there.
  3. Form `G = jg(mugrad, g)` and `H = jhj(mugrad, h)` on the fixed lattice.
  4. Push the vector `G` and the symmetric `H` (6 channels) with `bound='zero'`.
  5. Return `jac(phi)` moved to `(D, *spatial, D)` as the "mugrad", so that the existing `jg`/`jhj` in `do_vel` apply the J^T rotation that `exp_backward` expects.

  I prototyped this; it gives the last column of the first table (all cases ≈ 0.998, the same as the matching-lattice case). The cost is pushing 3 + 6 channels instead of 1 + 1 per image channel, and computing ∇m on the fixed lattice. In a 48³ end-to-end run it reached a lower final loss on case b (2.7e-5 vs 1.7e-4) and case c (7.6e-5 vs 2.0e-4). The deformation error was mixed: 2.73 vs 2.14 mm on b, 3.68 vs 4.24 mm on c. The smooth phantom leaves the deformation poorly determined in flat regions, so I would not read much into those two numbers. I left it out of this PR because it changes how the gradient is assembled, not only a boundary setting.
- `SmallDefModel.propagate_grad` has the same node-sampling approximation (2 mm field: 11.4×; half-voxel shift: 1.72×). Its boundary is already consistent. The same change applies, returning an identity Jacobian.
- `ShootModel.propagate_grad` (forward term) rebuilds `phi_right` with `smart_pull_grid`, whose default is `bound='dft'`, while the forward pass uses `'zero'`. Switching it to `'zero'` made no measurable difference (still 1.39× with a smaller FOV), so I did not change it here. The shooting error with mismatched lattices (1.3–3.3×) has another source that I have not tracked down.
- `do_affine`, moving-side branch (already listed in #111): it uses the same push-then-multiply pattern through `phi_right`.
- With a coarse pyramid level, the nonlinear lattice and the image lattice usually differ even when they match at full resolution. So case b/c behaviour probably affects the coarse levels of ordinary runs. Not measured.

---
_Generated by [Claude Code](https://claude.ai/code/session_01MHwEa9dAf8MwawzzozKLzE)_

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0746392d0d36`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.