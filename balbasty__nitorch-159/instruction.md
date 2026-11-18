# Issue

**Title:** Fix FieldCG/FieldRelax NameError; pass normalised factors to Gauss-Newton optimisers

## Description

## Problem

`FieldCG.search_direction` and `FieldRelax.search_direction` (`nitorch/tools/registration/optim/newton.py`) referenced an undefined `dim` when normalising the regularisation factor:

```python
if self.reduce:
    prm['factor'] = prm['factor'] / py.prod(grad.shape[-dim-1:-1])
```

`reduce` defaulted to `'mean'`, so both optimisers always raised `NameError`. This broke `topup_fit`.

Looking into it showed that the optimiser-side normalisation (`reduce='mean'`, also on `GridCG` / `GridRelax` / `GridJacobi`) was inconsistent across callers:

| Caller | Factor it passed | Net effect |
|---|---|---|
| `nitorch register` (`pairwise_run`) | raw `nonlin.factor` | correct: the only real user of `reduce` |
| `_prototype_{smalldef,svf,shoot}.py` | `lam / prod(shape)` | normalised twice (solver used `lam/N²`, objective `lam/N`) |
| `topup.topup_fit` | `lam / numel` | would have been normalised twice (crashed first) |
| `utils.make_optim_field` | raw | no live callers |

## Changes

**Optimisers use `factor` as given** (`reduce` removed from `Grid*` and `Field*`).

**`pairwise_makeobj.sync_nonlin_optim`** copies the model's voxel size and penalty into its optimiser, dividing `factor` by `prod(nonlin.shape)`, as the objective in `objects.py` does. It is used by:
- `pairwise_run.run_single` / `run_pyramid` at every pyramid level, replacing two duplicated sync blocks;
- `make_nonlin_optim`, which previously passed `penalty=` to `GridCG`/`GridRelax`. They have no such parameter, so `Optim.__init__` silently dropped it. Penalty and voxel size are now applied after construction: from `nonlin` when it holds data, while explicit `penalty=` / `voxel_size=` arguments override them as given.

**`FieldGaussNewton`** treats fields as channel-first `(..., K, *spatial)`, which is what `spatial.solve_field*` expect:
- New `dim` option, the number of spatial dimensions. It defaults to `grad.dim() - 1` (the solvers' own default) and is needed for batched fields. It is always forwarded to the solver.
- `_add_marquardt` adds damping to the diagonal Hessian channels (axis `-dim-1`; length K, or 1 for a shared value). It previously sliced the last spatial axis. A comment documents the supported Hessian layouts.
- `lr` is now explicit. `bound` is stored and forwarded; previously `Optim.__init__` silently swallowed it.

**`spatial.solve_field` / `solve_field_fmg`** now forward `dim` to the closed-form solver used when there is no membrane or bending penalty.

**`topup`** builds `FieldCG(..., dim=ndim)`. The `svf` model no longer crashes on loss-only evaluations (`grad_pos` is `None` when `grad=False`).

## Tests

- New `nitorch/tests/test_field_optim.py`:
  - `FieldCG` and `FieldRelax` run with `fmg` = 0 and 2, all three Hessian layouts, and membrane and bending penalties.
  - A closed-form check that `factor` is used as given.
  - Marquardt damping goes on the diagonal channels only.
  - Batched fields with an explicit `dim`; `lr` and `bound` are honoured.
  - `topup_fit` on a small synthetic pair (smalldef and svf, membrane and bending): the fitted field is finite and the corrected mismatch drops.
- `test_register_pyramid_reg.py`:
  - The optimiser factor is `factor / prod(shape)` at each level.
  - `make_nonlin_optim` applies the normalised penalty and voxel size from `nonlin`, uses explicit values as given, and leaves the factor alone when the model has no data.
- Before the fix, `FieldCG(membrane=1).search_direction(grad, hess)` raised `NameError`.
- After it, the new tests and the neighbouring line-search, solver and registration tests pass.
- **No behaviour change for `nitorch register`:** small nonlinear registrations (svf and smalldef, `@@optim gn`, CG and relax, default pyramid) give bit-identical outputs (transforms and resliced images) before and after this PR.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

https://claude.ai/code/session_014dBjaSUwFitTbPETDqHgnm

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e521f06bbecb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.