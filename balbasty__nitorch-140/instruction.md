# Issue

**Title:** REFACTOR(register): orthonormal affine bases; switch_basis / optim_grad from the Gram matrix

## Description

**Depends on #139 — merge #139 first.** This branch is stacked on `claude/bugfix/114-switch-basis`. Until #139 is merged, the diff below also shows its two commits. After the merge, only this PR's commit remains (`0943a9d`).

## Summary

This follows up the "Not changed: needs a decision" section of #139, using the design the maintainer approved.

### 1. Every affine basis is orthonormal

The inner product is the Frobenius one, `<A, B> = trace(AᵀB)`, on the full homogeneous `(D+1, D+1)` matrices. The projection uses the same inner product.

| generator | matrix | norm |
|---|---|---|
| translation `i` | `E_{i,D}` (last column) | 1 |
| rotation `(i, j)` | `(E_ij − E_ji)/√2` | 1 |
| zoom `i` | `E_ii` | 1 |
| shear `(i, j)` | `(E_ij + E_ji)/√2` | 1 |
| similitude scale, 3D / plain 2D | `I_D/√D` (homogeneous corner 0) | 1 |
| similitude scale, embedded 2D (`LogAffine2d`) | was `diag(1,1,0)/√3`, now `diag(1,1,0)/√2` (zero on the normal axis) | was √(2/3), now 1 |

The generators are also mutually orthogonal: translations, rotations (antisymmetric), zooms (diagonal) and shears (symmetric, off-diagonal) use disjoint entries or are orthogonal by symmetry.

- `spatial.affine_basis` was already orthonormal for every group the registration uses (T, SO, SE, CSO, Aff+) in 2D and 3D. It is **not changed**, so other callers of `spatial` are not affected.
- `LogAffine2d` used to pick rows of the 3D basis by hand-written indices (`_make_basis_2d`) and then zero one entry of the similitude scale. It now embeds `spatial.affine_basis(name, 2)` in the plane orthogonal to `plane` (`_affine_generators(name, dim, plane)`). The embedding only moves entries, so the 2D bases stay orthonormal. The only generator whose value changes is the similitude scale. Translations, rotations, zooms and shears are identical to before, in the same order.

### 2. Step and gradient maps come from the basis matrices

Let `B_X` be the `(F_X, (D+1)²)` matrix whose rows are the flattened generators of basis `X`, so that `x ∈ X` encodes the log-matrix `L = Σ_k x_k B_X[k]`. With orthonormal generators, the orthogonal projection of `L` onto `span(B_Y)` has coordinates

```
y = M x,    M = B_Y B_Xᵀ        (Gram matrix, shape [F_Y, F_X])
```

- If `span(B_X) ⊆ span(B_Y)`, then `Σ y_l B_Y[l] = L` exactly, so the matrix is kept, and `MᵀM = I`.
- Otherwise, `y` is the least-squares projection of `L`.

When the model lives in basis `Y` but only the parameters `p` of a sub-basis `X` are optimised (`-g/--progressive`), a step `d` is applied as `q += M d`. By the chain rule, `∂exp(q)/∂p = Σ_k ∂exp/∂q_k · M[k, :]`, so the gradient (and the matrix-valued Jacobian) with respect to `p` is `Mᵀ g`. As a result, `<optim_grad(g), d> = <g, switch(d)>` holds by construction.

Changes in `nitorch/tools/registration/objects.py`:
- New helpers `_affine_group`, `_affine_generators`, `_affine_gram`, `_affine_contains` and `_affine_switch`. `M` is computed once in float64 and cached per `(src, dst, dim, plane)`; a second cache keeps one copy per `(dtype, device)`. Entries that are integers up to rounding (for example `2·(1/√2)²`) are snapped, so shared components are copied bit-exactly. Switching to the same basis returns a plain clone. No per-voxel work is involved: `M` is at most 12×12.
- `LogAffine._switch_basis` / `LogAffine2d._switch_basis`: the two hand-coded index-copy branches (about 90 lines) are replaced by `dat @ Mᵀ`. `LogAffine2d._switch_basis(dat, src, dst, plane=0, dim=3)` is backwards compatible with the positional `(dat, src, dst)` call.
- `LogAffine._optim_grad`: the hand-coded slices and the zoom-gradient sum are replaced by `einsum('...kij,kl->...lij', grad, M)`. "Cannot optimize X in a Y basis" is still raised, now whenever `span(Y) ⊉ span(X)`. `LogAffine2d` no longer overrides `_optim_grad` (the `self.dim = 2` toggle is gone) or `basis`. It only exposes its `plane` to the shared code.
- Public `LogAffine.switch_basis`, `LogAffine2d.switch_basis` and `AffineModel.switch_basis` now go through the same map. Similitude → affine keeps the matrix, and affine → similitude → affine is a round-trip. **The strict xfail from #139 is now a passing test.**
- `AffineModel.Parameters` applies steps through the model's own map, so `Affine2dModel.Parameters` (a copy that ignored the plane) is removed. `mul`/`mul_` keep the semantics from #139, "factor for the optimised parameters, one for the others": each model parameter takes the factor of the optimised parameter it is built from, using the support of `M`. For example, all zooms take the factor of the similitude scale.

## Consequences

- **Numerical value of the similitude scale parameter.** In the 3D similitude model basis there is no change, because the generator was already `I/√3`. Two things do change:
  - The progressive step parameter (`optim='similitude'` inside an affine model) used to mean "zoom `s` on every axis" (generator `Σ E_ii`, norm √D). It now has the unit-norm generator, so it is smaller by a factor of √D: √3 in 3D, √2 for `-2d`.
  - The `LogAffine2d` / `Affine2dModel('similitude')` model parameter changes from `s_old` to `s_new = s_old·√2/√3`, because the scale generator was `/√3` and is now `/√2`. The matrices are unchanged. A per-parameter L2 `penalty` on a 2D similitude scale now applies to the unit-norm generator.
- **Nothing persists Lie parameters.** `register` and `affreg` (which calls `register`) write the exponentiated matrix (`io.transforms.savef(aff, …)`, LTA/RAS-to-RAS). The nonlinear output is a velocity field. An affine `init` is read as a matrix and projected with `spatial.affine_parameters` onto the model's actual basis tensor (`obj.basis` for 2D), so it stays consistent. No file format is affected.
- **Progressive-affine trajectories change slightly.** The scale direction of the optimised sub-basis is rescaled, so its gradient is divided by √D. Gauss–Newton steps are invariant to this rescaling (the step in matrix space is the same), and the end-to-end numbers below barely move. First-order optimisers (`gd`, `ogm`, `lbfgs`, …) with `-g` now take scale steps on the same footing as the other unit-norm generators.

## Tests

`nitorch/tests/test_register_switch_basis.py` is extended (344 tests, about 5 s). "Spaces" means 3D, plain 2D, and 2D embedded in planes 0, 1 and 2.
- `test_basis_orthonormal`: `B Bᵀ = I` for every basis in every space, both for the bases the registration objects build (`LogAffine(...).basis`, `LogAffine2d(...).basis`) and for independently built reference generators.
- `test_logaffine2d_basis`: the `LogAffine2d` generators equal the embedded 2D generators, with no exception. The similitude scale is `diag(1,1,0)/√2`.
- `test_switch_basis`: all 25 `(src, dst)` pairs in every space, using the real generators (the special similitude convention is gone). When `dst ⊇ src`, the log-matrix and the matrix agree to 1e-12. Otherwise the result equals the least-squares projection to 1e-12.
- `test_switch_basis_same`: same basis gives a bit-exact copy. `test_switch_basis_2d_copy`: the embedded switch equals the plain 2D one for every plane.
- `test_switch_basis_matches_optim_grad`: `<_optim_grad(g), d> == <g, _switch_basis(d)>` with matrix-valued `g`, for every `optim ⊂ basis` pair in every space.
- `test_optim_grad_chain_rule`: `exp(grad=True)` with a sub-basis equals the autograd Jacobian of `matrix_exp(Σ (M p)_k B_k)` with respect to `p` (3D and plane 1). `test_optim_grad_not_contained`: incompatible pairs raise.
- `test_switch_basis_similitude_keeps_matrix` (formerly a strict xfail): similitude → affine keeps the matrix, and → similitude round-trips, in every space. `test_affine_model_switch_basis` checks the same through `AffineModel`.
- `test_affine_parameters_mul_similitude`: the scale factor applies to all zooms. `test_affine2d_parameters_add`: `Affine2dModel` sub-basis steps embed exactly, for every plane.

Results (CPU, TS backend):
- `test_register_switch_basis.py`: **344 passed**.
- Fast set `nitorch/tests/test_register_*.py`: **655 passed, 17 skipped**, no xfail.
- With `--runslow`: `test_register_optim.py`, `test_register_symmetric.py`, `test_line_search.py`, `test_affine_tpm.py`, `test_grid_loss.py`: **62 passed**.

End-to-end runs use `register @loss mse @affine {similitude,affine} -g [-2d 1|2]` with the default pyramid and the Gauss–Newton optimiser, on the `test_register_optim` phantom (24³, 1 mm). Each phantom is `mov(x) = fix(T x)` and the expected result is `T⁻¹`. The tables give the max-abs error of the written LTA.
- "zoom" phantom, shift + rotation 0.08 rad + zoom: isotropic 1.04 for similitude, anisotropic (1.05, 0.97, 1.02) for affine, with in-plane components only for `-2d`.
- "rigid" phantom, shift + rotation 0.08 rad.
- Identity would be off by about 0.08 on the linear part and about 1.5 mm on the shift.
- "Before" is #139's head `2f423ec`.

| case | linear before | linear after | shift before (mm) | shift after (mm) |
|---|---|---|---|---|
| `similitude -g`, 3D, zoom | 0.0145 | 0.0145 | 0.0333 | 0.0333 |
| `affine -g`, 3D, zoom | 0.0066 | 0.0065 | 0.0084 | 0.0085 |
| `similitude -g -2d 1`, zoom | 0.0113 | 0.0113 | 0.0109 | 0.0109 |
| `affine -g -2d 1`, zoom | 0.0040 | 0.0040 | 0.0030 | 0.0030 |
| `similitude -g -2d 2`, zoom | 0.0121 | 0.0121 | 0.0248 | 0.0247 |
| `affine -g -2d 2`, zoom | 0.0045 | 0.0045 | 0.0072 | 0.0072 |
| `similitude -g`, 3D, rigid | 0.0012 | 0.0012 | 0.0024 | 0.0024 |
| `affine -g`, 3D, rigid | 0.0027 | 0.0027 | 0.0050 | 0.0050 |
| `similitude -g -2d 1`, rigid | 0.0021 | 0.0021 | 0.0006 | 0.0006 |
| `affine -g -2d 1`, rigid | 0.0055 | 0.0055 | 0.0004 | 0.0004 |
| `similitude -g -2d 2`, rigid | 0.0014 | 0.0014 | 0.0009 | 0.0009 |
| `affine -g -2d 2`, rigid | 0.0018 | 0.0018 | 0.0012 | 0.0012 |

None of the cases gets worse. The largest change is 1e-4. The similitude "zoom" residual of about 0.012–0.015 is the same without `-g`, and was the same before this PR, so it does not come from the progressive path.

Part of #114
Depends on #139

---
_Generated by [Claude Code](https://claude.ai/code/session_01MHwEa9dAf8MwawzzozKLzE)_

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `83671bcbc5a6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.