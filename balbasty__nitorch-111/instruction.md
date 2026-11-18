# Issue

**Title:** FIX(register): symmetric losses (--symmetric) in register and affreg

## Description

## Summary

`--symmetric` crashed in both `nitorch register` and `nitorch affreg`. Once the crash was fixed, the symmetric objective still recovered nothing. On a synthetic pair with a known shift of (3, -2, 1.5) mm, the recovered translation was **(0, 0, 0)**, because the backward term cancelled the forward term. This PR makes the symmetric objective the sum of a forward term (fix vs mov∘T) and a backward term (mov vs fix∘T⁻¹), with gradients that agree with finite differences.

Fixes:

1. **Crash** (`register/cli.py::build_losses`). The per-level factor rescaling looked up `options.loss[j]`, where `j` counts similarity terms. A symmetric loss adds two terms, so the lookup ran past the list and raised `IndexError`. Each term is now mapped to the option loss it comes from (`owners`). This mapping is also correct when an `extra` pseudo-loss is skipped. The loop also no longer shadows the outer level index `i`.
2. **Cancellation** (`register/cli.py`). The backward term was `Similarity(lossobj, mov, fix, backward=True)`, which compares fix with mov∘T⁻¹ and so pulls T toward the inverse shift. It is now `Similarity(lossobj, fix, mov, backward=True)`, the same thing `Similarity.reverse()` builds. The `emmi` branch used to call `load_image` with arguments it does not accept, and to swap `loss.fix`/`loss.mov` in the options (which also changed the outputs written later). It now reloads both images with their roles swapped through `preproc_image`, without changing the options.
3. **`SVFModel.exp2` ignored `add_identity=False`** (`objects.py`). It always returned transformation fields. `pairwise_impl` uses those fields as displacements whenever a backward term is present. As a result, symmetric + SVF gave the wrong value and gradient even for the forward term: `register -s` with `@nonlin svf` found (2.44, -1.89, 1.60) before this fix and (3.01, -2.00, 1.52) after.
4. **Inverse composition for `-p mov` / `-p fix` with a nonlinear component** (`pairwise_impl.py`). The forward transform is A∘φ (affine on the moving side), so its inverse is φ⁻¹∘A⁻¹. The backward term used to build A⁻¹∘φ⁻¹. In backward terms the affine now changes side (`_backward_position`). This matches `pairwise_postproc.warp_one_image(backward=True)`, the function that writes the outputs. The default symmetric position (A½∘φ∘A½) was already correct.
5. **Affine gradient in `do_affine`, fixed-side branch** (`pairwise_impl.py`). It took the jacobian of the forward field `phi0` even in backward terms. It now uses `phi00`, the field the term actually warps with.

## Tests

`nitorch/tests/test_register_symmetric.py`, 25 tests, about 10 s on CPU with the TorchScript backend. **On master: 15 failed / 10 passed. With this PR: 25 passed.** `test_register_mi.py` and `test_register_parser.py` still pass (52 passed in total).

- `test_register_symmetric_translation`, `test_affreg_symmetric_translation`: end-to-end CLI runs with `--symmetric` on a 24³ pair shifted by (3, -2, 1.5). The translation written to the `.lta` must be within 0.1 mm of the true shift. On master both raise `IndexError`; with only the crash fixed, both return (0, 0, 0).
- `test_symmetric_is_sum[do_affine|do_vel × s|m|f]`: the value and gradient of `symmetrize()` must equal (forward + backward) / 2.
- `test_composition[s|m|f × fwd|bwd]`: the loss computed during registration must equal the loss computed with `warp_one_image`, i.e. the transform written to disk. Covers fixes 3 and 4.
- `test_affine_only_grad[fwd|bwd|sym]`: finite-difference check of the affine-only gradient, relative error < 1e-5. This case was already correct on master; it is kept as a regression test.
- `test_affine_grad_with_nonlin[fwd-f|bwd-m]`: finite-difference check of the affine gradient with a fixed SVF, relative error < 1e-3. Covers fix 5.
- `test_vel_grad[fwd|bwd|sym]`: directional finite-difference checks of the SVF velocity gradient.
- `test_svf_exp2`, `test_reverse_swaps_images`: unit checks.

## Found, not fixed here

- **Velocity gradient when a fixed lattice differs from the nonlinear lattice.** This happens with an affine, or with different voxel sizes, in forward and backward terms alike. Finite differences disagree strongly with the analytical gradient: cosine about 0.2 on small 8³ test cases, versus 0.998 when the lattices match. A likely cause, not yet confirmed: the warp samples the displacement with `bound='zero'`, while `SVFModel.propagate_grad` pushes the gradient with `bound='dft'`, so the two differ wherever the fixed lattice extends past the nonlinear field of view. This needs a separate, careful look at how the gradient is propagated, so it is not changed here.
- **Approximate affine gradient on the moving side.** The moving-side (`'ms'`) branch of `do_affine` pushes the gradient through `phi_right` before taking image gradients on the nonlinear lattice. It is exact only when `phi_right` is the identity (relative error about 0.2–0.3 otherwise, forward included). Because of fix 4, backward terms with `-p fix` now go through this branch, and backward terms with `-p mov` through the exact one.
- `Similarity.__truediv__` computes `factor / self.factor`, and `SumSimilarity.__truediv__` computes `factor / loss`. Both are inverted, and the second raises `TypeError`. `concurrent_pyramid` divides by the number of levels, so `--concurrent` crashes (with or without `--symmetric`).
- `nitorch/core/_linalg_logm.py` calls `scipy.linalg.logm(..., disp=False)`. Recent SciPy (1.18 here) no longer accepts `disp`, so `MeanSpace` crashes and so does any `@nonlin` run. With SciPy 1.15 it works.
- `warp_one_image`, reslice without a nonlinear component: `if affine.position[0].lower():` is always true, so the affine is always squared.
- `affreg`: `--line-search` is passed to `register` as `-s`, which sets `@@optim -s` (search). Its effect has not been checked.
- `emmi` does not recover the shift on this synthetic pair even without `--symmetric` (about (0.37, 0.07, 0.19)). The symmetric `emmi` path now runs without crashing; I did not look into its accuracy.

---
_Generated by [Claude Code](https://claude.ai/code/session_01MHwEa9dAf8MwawzzozKLzE)_

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a893ab45ddc4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.