# Issue

**Title:** FIX/ENH(register): MI adjoint smoothing; Hessian from the term Gauss-Newton drops

## Description

## Summary

Part of #114. Follows up on #120 (mis-scaled MI Hessian).

1. **Gradient (bug fix, unchanged from the first commit).** `JointHistCount.backward` smoothed the gradient with the forward kernel. With the `replicate` bound that kernel is neither symmetric nor mass-preserving near the edges, so the adjoint is `Kᵀ`. The MI gradient was **6–8% off at the default fwhm=2**.
2. **Hessian (replaced).** `mi` and `entropy` no longer return a Gauss–Newton diagonal. They return the absolute value of the per-voxel term that Gauss–Newton drops, following the preconditioner of Balbastre et al. (MedIA 2021, eq. 24). The GN term has the wrong sign for MI, and the dropped term is the one that carries the curvature. With unit Newton steps and no line search, the old Hessian increases the loss in 46 of 48 settings tested, and the new one decreases it in all 48.
3. **Default spline order of `mi`/`entropy`/`MI`/`Entropy` is now 3**, as in the CLI.

The first commit's exact `diag(JᵀMJ)` in `JointHistCount.backward2` is kept as a utility, but MI no longer uses it.

### Why

Let `p = K h(x) / N` be the smoothed joint histogram, `J = ∂p/∂x`, `g = ∇_p L` and `F = ∇²_p L`. The Hessian with respect to the moving voxels is

    H = Jᵀ F J  +  diag_n( Σ_ab (Kᵀg)_ab · s² B''(u_n − a) B(v_n − b) / N )
        (A: Gauss–Newton)    (B: dropped by Gauss–Newton)

- **A ≼ 0 for every norm.** A moving-image perturbation leaves `py` unchanged (`Σ_a B'(u−a) = 0`), so `Hy` is constant. Every norm is then `φ(H(Y|X), Hx)` with `∂φ/∂H(Y|X) > 0` and `∂φ/∂Hx ≥ 0`. For Studholme, arithmetic and geometric, that second coefficient is `MI/(·) ≥ 0`. Both entropies are concave in `p`, so `Σ_k φ_k ∇²H_k ≼ 0`, voxel coupling included. Plain MI is the Cauchy–Schwarz argument from the first commit. The old code returned `diag(−A)`, which is not a bound on anything.
- **Normalised variants.** The remaining rank-2 terms `φ_kl ∇H_k ∇H_lᵀ` are dropped. That is Newton on the Dinkelbach surrogate of the ratio. Studholme becomes `ρ_k·Hxy − (Hx + Hy)`, which is 0 at the current iterate and negative only if NMI improves. Its first-order coefficients equal the true ones, so the same `g` table serves for all norms. Geometric needs the tangent bound on `√Hx`.
- **Preconditioner.** `A` is bounded by 0, and `B` is voxel-diagonal, so its PSD bound is its absolute value: `P_n = |b_n|`. `b_n` is the pull of the same `Kᵀg` table as the gradient, with `B''⊗B` in place of `B'⊗B`. For plain MI it is the second derivative in `u` of `−log p(y|x)`. Its scale is that of the conditional density (`Δ² log p`), not of `1/count`. That mismatch was the source of the `bins⁴/voxels` scaling in #120.
- **Spline order 1.** `B''` is a sum of Diracs at bin edges, so the pointwise term is 0 almost everywhere. Its average over one bin is used instead. Since `B1 * B0 = B2`, that is exactly the order-2 `B''`.
- **Caveat.** With smoothing (fwhm > 0) and the `replicate` bound, `K` is not mass-preserving at the edges, so `py` moves slightly and `A ≼ 0` holds only approximately. The largest eigenvalue is about 1e-3 of the spectrum.

### Changes

- `core/_hist.py`: `_jhistc_backward_hess` and `JointHistCount.backward_hess(g, x, w, min, max)`. These compute `Σ_ab g_ab ∂²hist_ab/∂x_n²` with adjoint smoothing, per axis, falling back to order 2 on the curvature axis when the order is 1.
- `losses/mi.py`: `mi` and `entropy` use `|backward_hess(g)|` for every norm. The norm-specific Hessian code is gone. `min`/`max` are now passed to the Hessian. The default order is 3.
- Merged `master`, which already contains the TS fixes this relies on: the `Spline(2).hess`/`Spline(1).grad` signs, batched grids in `nd.*`, and `@loss mi -n` reaching the loss.

### Results

Setup: 24³ phantom from `test_register_optim`, analytic warps (no resampling), translation, fwhm 2, two starting points `t0`. Slicewise is along z.

**One unit Newton step, no line search.** The table shows `|t1|/|t0|` (optimum at 0), and "up" means the loss increased. Old GN is the head of this PR before this change; new is this change.

| norm | order | setting | old GN | new |
|---|---|---|---|---|
| studholme | 1 | volume, 32 bins | 51 up, 30 up, 7.8 up | 0.031, 0.012, 0.26 |
| studholme | 1 | volume, 16 (auto) | 259 up, 207 up, 68 up | 0.049, 0.052, 0.017 |
| studholme | 1 | slicewise, 8 (auto) | 99 up, 96 up, 42 up | 0.43, 0.27, 0.29 |
| studholme | 3 | volume, 32 | 230 up, 142 up, 36 up | 0.017, 0.008, 0.22 |
| studholme | 3 | volume, 16 (auto) | 1180 up, 981 up, 297 up | 0.058, 0.058, 0.035 |
| studholme | 3 | slicewise, 32 | 24 up, 19 up, 2.8 up | 0.43, 0.29, 0.71 |

Plain MI behaves the same. Across both norms, orders 1 and 3, and all four settings (48 cases), old GN increases the loss in 46 and the new Hessian decreases it in all 48. The third starting point is `(1.5, −1, 0.5)`.

**Curvature along `d = −g/|g|`**, as the ratio `dᵀHd / FD`. The table shows Studholme; plain MI is similar.

| order | volume 32 | slicewise 32 | volume 16 | slicewise 8 |
|---|---|---|---|---|
| 1: old GN → new | 0.044–0.087 → 2.4–2.8 | 4.9 → 36 (FD < 0 at one t0) | 0.003–0.005 → 0.87–0.93 | 0.012–0.014 → 1.2 |
| 3: old GN → new | 0.008–0.016 → 2.1–2.3 | 0.33 → 11 (FD < 0 at one t0) | 0.0007–0.001 → 0.81–0.87 | 0.003 → 1.06–1.09 |

The only setting where the new value is far from 1 is slicewise with 32 bins, about 0.56 voxels per bin. There the term overestimates, so steps are short rather than divergent. Adding `diag(−A)` on top changes the new column by at most 3% everywhere outside that setting.

**End-to-end** `nitorch register @loss nmi -n <order> @affine {translation,rigid} @@optim gn`, max shift error in mm, for the shifts (1.5, −1, 0.5) and (3, −2, 1.5):

| | order 1, Wolfe | order 3, Wolfe | order 1, `-s 0` | order 3, `-s 0` |
|---|---|---|---|---|
| old GN | 0.004–0.019 | 0.003–0.044 | diverges (0.8 mm, then crash) | diverges (15 mm, then crash) |
| new | 0.003–0.006 | 0.002–0.050 | 0.004–0.006 | 0.002–0.003 |

With the default Wolfe search, accuracy on this phantom is comparable. The search absorbs the scale: the Hessian is evaluated only 3 times per registration, and the other evaluations are line-search gradients. Without a line search, only the new Hessian converges.

## Tests

`nitorch/tests/test_register_mi_hess.py` was rewritten:
- `test_gn_term_nsd`: `Jᵀ(Σ_k φ_k ∇²H_k)J ≼ 0` (full matrix) for all four norms, fwhm 0 and 2.
- `test_mi_hess_is_abs_newton_term`: the returned H equals `|true diagonal − diag(JᵀFJ)|`, where the true diagonal is a per-voxel finite difference of the analytic gradient. Covers all four norms, orders 2 and 3, fwhm 0 and 2.
- `test_jointhist_backward_hess`: equals the derivative of `backward` for orders 2 and 3, and the one-bin finite difference for order 1, with weights and smoothing.
- `test_mi_hess_slicewise`: slices are independent, for orders 1 and 3.
- The gradient and `backward2` tests are kept.

`nitorch/tests/test_spline_derivatives.py`: `Spline.grad`/`.hess` against finite differences for orders 1–7. The kernel relies on `.hess`.

The full suite passes locally on the merged branch (TS backend, torch 2.15, CPU).

## Notes

- With `@@optim gn -s 0`, the old Hessian's divergence ended in `TypeError: 'NoneType' object is not iterable` inside `register`. This change doesn't touch that path; it's a robustness issue in its own right.
- `HistCount` (1D) `backward2` still has the edge half-bin issue from the first commit. It is unused by the losses here.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

https://claude.ai/code/session_014dBjaSFsw15kdPX4Vj8HWj

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1864854e1025`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.