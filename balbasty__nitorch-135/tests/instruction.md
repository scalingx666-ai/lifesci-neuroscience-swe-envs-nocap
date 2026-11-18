# Issue

**Title:** FIX(register): exact displacement gradient when the fixed and field lattices differ

## Description

## Summary

Part of #114. , which fixed only the boundary condition.

When the fixed image lattice differs from the lattice of the nonlinear field (different voxel size, FOV or orientation, or an affine on the fixed side), the velocity/displacement gradient of `SVFModel` and `SmallDefModel` was wrong. The error was in the interior, not only at the border: with a 2 mm field on 1 mm images, the analytic gradient was about 10× too large along its own direction. This PR computes the chain rule on the fixed lattice. With the change, the SVF gradient matches autograd as well as in the matching-lattice case, and the smalldef gradient is exact.

### Derivation sketch

Notation: `x` is a fixed voxel; `R` (right) maps fixed voxels to field voxels; `L` (left) maps field voxels to moving voxels; `D` is the displacement on the field lattice (for SVF, `D = exp(v)`). The forward pass in `do_vel` is

    warped(x) = mu( L (R x + D̃(R x)) ),      D̃(y) = Σ_k w_k(y) D_k

where `D̃` is `D` linearly interpolated with `bound='zero'` (`smart_pull_grid(phi, right, bound='zero')`). With `g = dLoss/dwarped`, the exact gradient with respect to the nodes of `D` is

    dLoss/dD_k = Σ_x w_k(R x) · g(x) · L' ∇mu(warp(x))   =  push_R( g · L'∇mu∘warp )_k

`push_R` is the adjoint of the forward pull: same weights, `bound='zero'`, `extrapolate=True`.

The old code computed `push_R(g)_k · L'∇mu(L(y_k + D_k))` instead. It pushed the scalar `g` first, then multiplied by the image gradient sampled at the field node `y_k`, not at each fixed voxel that contributes to that node. That is exact only when every fixed voxel falls on a node.

The new helper `_push_grad_fixed` computes the exact expression:
1. Rebuild the forward warp on the fixed lattice.
2. Sample `L'∇mu` there.
3. Form the vector gradient `jg(∇mu, g)` and the symmetric Gauss–Newton term `jhj(∇mu, h)` on the fixed lattice.
4. Push them to the field lattice with `bound='zero'`: 3 channels for the gradient, 6 for the Hessian.

The Hessian is pushed the same way as before, so it stays the same kind of approximation.

The interface does not change. `propagate_grad` still returns `(g, h, gmu)`, and `do_vel` still computes `jg(gmu, g)`, `jhj(gmu, h)` and then `exp_backward`:
- **SVF:** `exp_backward` expects the gradient with respect to a right composition, `Phi∘(Id+δ) ≈ Phi + Jac(Phi) δ`, i.e. `Jac(Phi)' dLoss/dD`. The matching-lattice path has always produced this, as `(L Jac)'∇mu`. So in the new path `gmu = Jac(Phi)`, laid out as `(D, *spatial, D)`, and the caller's `jg`/`jhj` apply `Jac(Phi)'`.
- **smalldef:** `gmu` is an expanded identity (a stride-0 view, no allocation).
- **`Nonlin2dModel`** still works: `P · Jac'` is applied in the same order as before.

When the lattices match (`right is None`), the code path is untouched, and the outputs (loss, gradient, Hessian) are **bitwise identical** to master. Checked for SVF and smalldef, with no affine and with a moving-side affine, for forward and symmetric losses. One exception is expected: in a symmetric loss with an affine, the backward term has a fixed-side affine, so it goes through the new path and changes, as intended.

### Gradient accuracy before → after

Setup: brain-like phantom, 96³ at 1.67 mm (CPU; 128³ was too slow with the TorchScript backend). The moving image is the fixed one warped by a known smooth deformation plus a small rigid transform. MSE loss, evaluated at a random smooth velocity. The reference gradient is autograd through a copy of the `do_vel` forward pass; it agrees with directional finite differences (FD) to about 3e-4. "Border" means within 3 field voxels of the field's edge. The table gives the cosine between the analytic and reference gradients, master → this PR.

| case | lattices | SVF all | SVF interior | SVF border | smalldef all |
|---|---|---|---|---|---|
| a | everything on one 96³ lattice | 0.998 → 0.998 (bitwise) | 0.998 → 0.998 | 0.999 → 0.999 | — |
| b | field at `-v 3.33` (2× image voxel), mean space 49³ | 0.920 → **0.998** | 0.920 → 0.998 | 0.977 → 0.998 | 0.893 → **1.0000** |
| c | moving rotated 8° in its header, 1.04× voxel, rigid affine, default mean space | 0.936 → **0.998** | 0.936 → 0.998 | 0.721 → 0.942¹ | 0.917 → **1.0000** |
| d | moving is a z-slab, field from `-f mov` (the fixed image extends past the field) | 0.997 → 0.998 | 0.997 → 0.998 | 0.997 → 0.998 | 0.9998 → **1.0000** |

¹ The border band holds less than 0.1% of the gradient energy in case c.

SVF stays at about 0.998 because `exp_backward` (DARTEL-style scaling and squaring) is itself approximate; case a hits the same limit. For smalldef, the relative error against autograd is now 0.000 (it was 0.44–0.55 in cases b and c). On 12³ random-texture images with a 2 mm field, the ratio of analytic to FD derivative along the gradient goes from 10.6 to 1.005 (SVF) and from 11.4 to 1.000 (smalldef).

### Cost (96³, double precision, one `do_vel(grad=True, hess=True)`)

The new path allocates on the fixed lattice: the warp (3 channels), the image gradients (3·K), the vector gradient (3) and the Hessian (6). The old path allocated the image gradients on the field lattice and pushed 1+1 channels per image channel.

| case | peak RSS above the forward pass, master → PR | `propagate_grad`, master → PR |
|---|---|---|
| b (49³ field) | +137 MB → +223 MB | 0.16 s → 0.62 s (`do_vel` 1.41 s → 1.50 s) |
| c (≈104×116×106 field) | +1123 MB → +1288 MB | 4.4 s → 5.6 s (`do_vel` 61 s → 65 s) |
| d (97×97×49 field) | +420 MB → +469 MB | too noisy to report (TorchScript backend) |

Timings come from one process per run and vary from run to run, so treat them as orders of magnitude. The extra memory is a few fixed-lattice vector fields.

### End-to-end: lower objective, larger deformation error

`nitorch register @loss mse @affine rigid @nonlin svf` with CLI defaults, at 48³ and 3.3 mm. Errors are the mean distance to the true deformation inside the brain; the starting error is 3.16 mm (3.07 mm in d). "Objective" is the CLI's own final value (data + regularisation), read from the optimiser's last printed step. Each cell reads master → PR.

**Merged tree (includes #130), noisy images (σ = 0.03, WM = 1), fixed MSE weight `-w 1100` (the noise precision).** The objective is the same function in both runs, so the values can be compared directly:

| case | objective (data + reg) | reg term | deformation error (mm) |
|---|---|---|---|
| a | 0.471 → **0.424** (−10%) | 0.087 → 0.088 | 2.24 → 2.84 |
| b | 0.707 → **0.491** (−31%) | 0.021 → 0.050 | 2.02 → 2.60 |

**Merged tree, noise-free, automatic MSE weight (#130 Gamma prior), case a:** objective −3.92 → **−4.48**, final MSE 5.3e-5 → 1.7e-5, error 2.08 → 3.19 mm.

**Before #130, noisy images, automatic weight:** final MSE a 3.75e-4 → 3.66e-4, b 7.39e-4 → 4.86e-4, c 6.82e-4 → 3.99e-4, d 4.32e-3 → 4.00e-3. Errors a 2.39 → 3.23, b 2.33 → 2.61, c 3.92 → 4.14, d 3.29 → 3.97 mm.

Interpretation. With the exact gradient, the optimiser reaches a clearly better optimum of the objective it is given: 10–31% lower with a fixed weight, and lower in every other setting. Those optima lie further from the true deformation on this phantom, so the gap comes from the objective and its default penalties, not from the gradient. Specifically:
- The old gradient did not act as damping through its size. At the three pyramid levels of case a, its norm was 0.98–1.06× the exact one and its Hessian diagonal 0.93–1.03×; it differed mainly in direction (cosine 0.86–0.95).
- Being wrong in direction, it stopped at less-fitted solutions, which happened to be closer to the truth. With the correct gradient, the regularisation is relatively weaker: the fit improves by 10–35% in the data term, while the regularisation energy stays flat (case a) or goes up 2.4× (case b).
- The fields are already close to folding on master. Noise-free case a: minimum Jacobian determinant 0.003 on master, −0.013 with this PR; 1.0% vs 2.5% of voxels with a determinant below 0.5.
- Not explained by the affine part: the rotation error is about 2.2° in both versions.
- In case a the mean-space field is 49³ on 48³ images, so the new path is active at every pyramid level, not only through the affine.

## Tests

`nitorch/tests/test_register_svf_grad.py`: 18 tests, about 8 s in total, none marked slow. **On master: 12 failed / 6 passed. With this PR: 18 passed.**
- `test_vel_grad_lattice[svf|smalldef × fov|shift|subvoxel|coarse|rotated]`: directional FD along the gradient and along 3 smooth random directions, |fd − an| < tol·‖g‖. Tolerance is 0.05 for SVF (`exp_backward` is approximate) and 1e-5 for smalldef. Lattices: smaller FOV, shifted FOV, sub-voxel shift, 2 mm field on 1 mm images, and a rotated 1.3 mm field. The former strict `xfail` (`coarse`) now passes.
- `test_vel_grad_lattice_symmetric[svf|smalldef × bwd|sym]`: backward and symmetric losses on the coarse field. The smalldef tolerance is 0.2: its backward gradient assumes inv(Id+D) = Id − D, which is off by about 12% here even when all lattices match.
- `test_smalldef_grad_autograd[coarse|rotated]`: the smalldef gradient equals autograd through a copy of the forward pass to a relative error below 1e-8.
- `test_hess_lattice[svf|smalldef]`: the pushed Hessian has the right shape, is finite and has a non-negative diagonal.

All `nitorch/tests/test_register_*.py` pass on the merged tree (305 passed, 15 skipped); the `--runslow` set also passed before the merge (14 passed).

## Found, not fixed here

- **Shooting** (`ShootModel.propagate_grad`), out of scope. FD along the gradient with mismatched lattices: 1.39× (smaller FOV), 1.29× (sub-voxel shift), 3.3× (2 mm field), against 1.01× with matching lattices. It uses a left-composition model and rebuilds `phi_right` with `bound='dft'`, while the forward pass uses `'zero'`. Changing that bound alone did not help, so the error has another source.
- **Moving-side affine gradient** (`do_affine` `'ms'` branch; this is the default symmetric position): same push-then-multiply pattern through `phi_right`. Not changed; .
- **smalldef backward/symmetric terms**: the gradient uses inv(Id+D) ≈ Id − D, while the forward pass uses `grid_inv`. About 12% off along the gradient, whatever the lattices.
- **Default nonlinear penalties vs MSE weight**: see the end-to-end section. With an exact gradient, `register` with default penalties fits these phantoms more closely than the true deformation. That suggests the defaults (or the automatic MSE weight) under-regularise at this resolution. I have not tuned them here.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

https://claude.ai/code/session_01MHwEa9dAf8MwawzzozKLzE

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `eadfe29bbb3f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.