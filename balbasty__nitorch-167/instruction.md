# Issue

**Title:** FIX(register): exact moving-side affine gradient (and symmetric Hessian) in do_affine

## Description

## Summary

Part of #114 (item: "Moving-side ('ms', default symmetric position) affine gradient in `do_affine` is approximate when `phi_right` is not the identity").

**Verdict: a bug, not an inherent approximation.** The moving-side branch used the push-then-multiply pattern that #135 fixed for SVF. The other affine paths already compute the chain rule exactly on the fixed lattice: the fixed-side branch of `do_affine`, and `do_affine_only`. The approximation also turned out to be larger than "when `phi_right` is not the identity" suggests. In the default symmetric position, `phi_right` contains the fixed half of the affine, so it is **never** the identity. The default affine gradient was therefore 13–23% off with no deformation at all, and 14–113% off with a field coarser than the images.

### Derivation

Notation as in #135: `x` is a fixed voxel, `R` is the right affine (fixed voxels → field voxels), `D` is the displacement, and `L` is the left affine (field voxels → moving voxels). The forward pass of `do_affine` is

    phi_right(x) = R x + D̃(R x)          (fixed lattice, field voxel coordinates)
    warped(x)    = mu( L · phi_right(x) )

- **Moving side** (`'m'`; the moving half of `'s'`; backward terms of `-p fix`): only `L` depends on θ, so

      dLoss/dθ = Σ_x  g(x) · ∇mu(psi(x))ᵀ · (∂L/∂θ) · [phi_right(x); 1]

  Here `∇mu` is the gradient of the linear interpolant at the warped point. Both it and the coordinate `phi_right(x)` are taken at each fixed voxel. The Gauss–Newton Hessian is `Σ_x h(x) a(x) a(x)ᵀ`, with `a(x)` the bracketed vector.
- **Old code:** `Σ_y push(g)(y) · ∇mu(L y)ᵀ (∂L/∂θ) [y; 1]` over the field nodes `y`, so the image gradient and the coordinate were taken at the node instead of at `phi_right(x)`. This is exact only if every `phi_right(x)` falls on a node.
- **Fixed side** (`'f'`; the fixed half of `'s'`): `R` depends on θ, so `a(x) = (L(I + J_D(R x)))ᵀ∇mu ⊗ [x; 1]`. This branch was already computed on the fixed lattice. Its only approximation: `J_D` comes from `grid_jacobian`, a finite-difference Jacobian of the displacement sampled at `R x`, not the derivative of the linear interpolant. That costs about 1e-5 relative on a coarse field (table below). I did not change it.
- **Symmetric** (`'s'`): `A = B·B` with `B` on both sides, so `a = a_mov + a_fix` and the exact GN Hessian is `Σ h (a_mov + a_fix)(a_mov + a_fix)ᵀ`. The code adds the GN Hessians of the two halves and drops the cross terms. Because `a_mov ≈ a_fix`, that sum is about **half** of the GN Hessian, so plain GN steps were about twice too long (second commit).

### Changes (`pairwise_impl.py`, `do_affine` only)

1. **Gradient (first commit), in the style of #135:**
   - Compute the moving-side term on the fixed lattice: `compose_grad(g, h, ∇mu(psi), ∂L/∂θ, grid=phi_right)`. `affine_grid_backward` already accepts a coordinate grid.
   - The image gradient `moving.pull_grad(psi)` is sampled once and shared by both halves of `'s'`. It is used unrotated for the moving side, then rotated by `(L J)ᵀ` for the fixed side, exactly as before.
   - Allocations: per term this removes two pushes to the field lattice, one `pull_grad` on the field lattice (K·D channels) and one dense `left` affine grid. `phi_right` is freed right after use.
2. **Symmetric Hessian (second commit):** `H = 2 (H_mov + H_fix)` in position `'s'`. Since `(a+b)(a+b)ᵀ ⪯ 2(aaᵀ + bbᵀ)`, this always majorises the GN Hessian, and here it is tight. Computing the exact cross terms would need a two-grid version of `affine_grid_backward`, a redesign beyond #135's pattern; I did not do it. This commit can be dropped independently (see the end-to-end note below).

**Unchanged**, checked bitwise on loss, gradient and Hessian: the loss value in every case; terms with the affine on the fixed side only (`-p fix` forward, `-p mov` backward); the identity-`phi_right` case (`-p mov`, field on the fixed lattice, zero displacement). `do_affine_only` and `do_vel` are untouched.

### Gradient accuracy, master → this PR

12³ smoothed-random images (moving voxel 1.2 mm), full 12-parameter affine at a random point (translations ≈ 0.5 mm, other parameters ≈ 0.05), MSE, central finite differences (FD) in double, ε = 1e-6. "same": SVF on the fixed lattice. "coarse": 2 mm field shifted by 0.3 mm. Displacement ≈ 1 voxel, with a zero band at the border. Entries are ‖g − FD‖/‖FD‖.

| position | term | same lattice, no deformation | same lattice | coarse field |
|---|---|---|---|---|
| `s` (default) | fwd | 1.4e-1 → **5.6e-10** | 1.4e-1 → **5.2e-10** | 1.4e-1 → **7.0e-10** |
| `s` | bwd | 2.2e-1 → 5.5e-8 | 2.2e-1 → 1.0e-7 | 1.17 → 8.9e-8 |
| `s` | sym | 1.3e-1 → 2.1e-8 | 1.3e-1 → 2.7e-8 | 4.0e-1 → 2.9e-8 |
| `m` | fwd | 4.7e-10 (bitwise) | 7.0e-3 → 4.5e-10 | 2.6e-1 → 3.1e-10 |
| `m` | sym | 2.1e-8 (bitwise) | 7.9e-3 → 3.4e-8 | 2.9e-1 → 3.2e-8 |
| `f` | bwd | 9.9e-1 → 6.1e-8 | 9.9e-1 → 1.0e-7 | **3.31** → 8.7e-8 |
| `f` | sym | 2.6e-1 → 1.8e-8 | 2.5e-1 → 3.0e-8 | 8.7e-1 → 1.5e-5¹ |
| `f` fwd, `m` bwd | — | unchanged (bitwise), ≤ 5.5e-10 | unchanged, ≤ 1.2e-7 | unchanged, ≤ 1.4e-5¹ |

¹ The fixed-side `grid_jacobian` approximation described above, unchanged.

Along the gradient direction, the old analytic/FD ratio was 0.88–0.91 for `s` on the same lattice, 0.69–2.3 on the coarse field, and up to **11.4** for `-p fix` backward terms. It is now 1.000 everywhere. With no deformation (scale 0), `s` on the coarse field went from 0.14–1.13 to ≤ 6e-8 relative error.

### Hessian vs the exact Gauss–Newton Hessian

The reference is `Σ_x h(x) a(x) a(x)ᵀ`, with `a = dwarped/dθ` from FD of a reference forward pass (whose loss matches `do_affine`'s). Same cases, deformation scale 1, full affine:

| position | master | first commit | this PR |
|---|---|---|---|
| `m`, `f` (one side), all terms | rel. err up to 0.21, eig(H_gn⁻¹H) ∈ [0.53, 1.62] | ≤ 3.5e-10 (`f`, coarse: ≤ 5e-6) | same |
| `s`, all terms | eig(H_gn⁻¹H) ∈ [0.36, 0.59] | ∈ [0.500, 0.504] | **∈ [1.0002, 1.0074]** (majorises, tight) |

Effect of the Hessian scale, from plain GN (no line search) on the affine with the SVF held fixed (16³, `-p sym`), starting from 0: after the first commit, the first step *increases* the loss (5.6e-4 → 2.2e-3). With this PR, the first step decreases it (5.6e-4 → 5.1e-4), the same as one-sided `-p mov` with its exact GN Hessian (5.6e-4 → 5.1e-4). With the default Wolfe line search, all three versions converge to about the same value (rigid: 4.885e-4 master, 4.872e-4 after the first commit, 4.871e-4 PR).

### End-to-end

`nitorch register @loss mse @affine rigid @nonlin svf`, both with `@@optim gn`, CLI defaults otherwise (symmetric position, 3 pyramid levels, interleaved). The phantom is the analytic one from `test_register_optim` at 24³, with a known rigid transform (rotation up to 0.08 rad, shift up to 2 mm). The table gives the CLI's final objective at level 0, which is the same function in all three versions (lower is better):

| transform | master | first commit (gradient) | this PR (gradient + Hessian) |
|---|---|---|---|
| default (`test_register_optim`-like) | −6.44 | −6.74 | −4.67 |
| seed 1 | −6.93 | −6.67 | −6.77 |
| seed 2 | −6.63 | −6.67 | −6.60 |
| seed 3 | −6.50 | −6.02 | −6.19 |

**No systematic end-to-end improvement on this phantom.** The winner changes from case to case. One PR run (default) ends in a clearly worse optimum: at the coarsest level it reached a much lower objective than the other two versions (−5.58 vs −4.04/−4.23), with more regularisation energy (0.09 vs 0.04–0.07). That field was then upsampled, and the finer levels did not recover: the run ends with 5× the regularisation energy of the others (0.21 vs 0.04). This is the same behaviour #135 and the open #114 items describe (pyramid transfer of SVF velocities, under-regularised defaults). The affine-only phase (`do_affine_only`) is identical in all three versions. With a free SVF, the joint problem is non-convex and the SVF absorbs part of the rigid motion. So these runs measure which optimum is reached, not whether the gradient is right; the controlled tests above do measure that. The rigid error of the written `.lta` (max abs error of the linear part) was smallest with master in all 4 cases (0.002–0.07, vs 0.015–0.20 for the other two). That is consistent with the SVF absorbing more of the motion once the affine gradient is right, but on this phantom I cannot tell that apart from optimum-hopping. As in #135, a well-posed end-to-end test is still missing (#114, Tests/CI).

### Cost

`do_affine(grad=True, hess=True)` at 64³ on CPU, 4 threads, best of 3, one process per measurement (TorchScript backend, so treat these as rough), master → this PR: `s` 0.28 → 0.23 s (field on the fixed lattice) and 0.25 → 0.24 s (coarse field); `m` 0.16 → 0.11 s and 0.12 → 0.14 s. Peak process RSS moved by −52 to +22 MB (772–888 MB in total). For `s`, the image gradient is now sampled once instead of twice. The new path does one `affine_grid_backward` on the fixed lattice per half, which costs more than the old field-lattice one only when the field is coarser than the image.

## Tests

New `nitorch/tests/test_register_affine_grad.py`: 40 tests, about 25 s on CPU, none marked slow. **On master: 32 failed / 8 passed. After the first commit only: 34 passed / 6 failed (the symmetric-Hessian tests). With this PR: 40 passed.**
- `test_affine_grad[m|s|f × fwd|bwd|sym × same|coarse]`: gradient vs central FD with a deformation. Relative error < 1e-6, or < 1e-4 for the fixed-side `grid_jacobian` cases on the coarse field.
- `test_affine_grad_no_deformation[m|s × fwd|sym]`: zero displacement on the coarse field (in `s`, `phi_right` is still not the identity). Relative error < 1e-6.
- `test_affine_hess_one_side_is_gauss_newton[m|f × fwd|bwd|sym × same|coarse]`: the loss equals the reference forward pass, and H equals the exact GN Hessian to < 1e-6 (fixed-side `grid_jacobian` cases < 1e-4).
- `test_affine_hess_symmetric_position[fwd|bwd|sym × same|coarse]`: H is symmetric, and its generalised eigenvalues against the exact GN Hessian lie in [1 − 1e-6, 1.05], so H majorises the GN Hessian and stays tight.

All `nitorch/tests/test_register_*.py` + `test_line_search.py`: **811 passed, 34 skipped** (default suite). The first commit also passed the full suite including slow tests (833 passed, 2 skipped).

## Found, not fixed here
- **Fixed-side Jacobian:** `do_affine`'s fixed-side branch uses `spatial.grid_jacobian(phi00, right)` (finite differences, then sampling). That is not the derivative of the linearly interpolated displacement the forward pass uses. It is about 1e-5 relative off when the field is not sampled at its nodes. Pulling the gradient of the interpolant instead (`grid_grad` of the displacement at `right`, with `bound='zero'`) would make it exact. The error is small, so I left it alone.
- **Exact symmetric GN:** the cross terms `Σ h a_mov a_fixᵀ` need a two-grid `affine_grid_backward`. Not done; the factor 2 is a tight majoriser instead.

---
_Generated by [Claude Code](https://claude.ai/code/session_01MHwEa9dAf8MwawzzozKLzE)_

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2925e276b733`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.