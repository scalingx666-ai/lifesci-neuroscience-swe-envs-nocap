# Issue

**Title:** FIX(spatial): singleton-dim finite differences, solver crashes, non-symmetric shear regulariser

## Description

## Summary

Fixes found while running `nitorch register` on 2D / thin synthetic data, and with non-default solvers and deformation models. Each commit is self-contained and has regression tests in `nitorch/tests/test_grid_solvers.py`; all new tests fail without the corresponding fix.

1. **Finite differences along singleton dimensions** (`spatial/_finite_differences.py`)
   - `diff1d`/`div1d` returned their input unchanged along dimensions of size 1. That is neither a derivative nor scaled by the voxel size.
   - They now use the neighbours implied by the boundary condition: zero derivatives for dct/dft/replicate, explicit values for zero/dst. `div1d` stays the adjoint of `diff1d`.
   - Before, regularisers added a spurious, voxel-size-dependent energy along singleton axes (e.g. a membrane diagonal of 1028 instead of 4 on a 4×4×1 grid with 32×32×8 voxels).
   - This broke 2D registration, and made the relaxation solver diverge on coarse multigrid levels of thin grids: garbage in float64, NaN (i.e. no update) in float32.
2. **Crashes of solver options**
   - `solve_grid`, `solve_grid_kernel` and `solve_field_kernel` defaulted to `stop='e'`, which `core.optim` no longer knows, so `@@optim gn -g 0` crashed. They now use `'max_gain'`.
   - `relax_slicers` produced empty slicers along dimensions shorter than the bandwidth, so `@@optim gn -q relax` crashed.
3. **`greens` on small dimensions** (`spatial/_shoot.py`)
   - The regulariser's impulse response was built on a 3^D/5^D patch, which failed on dimensions smaller than the patch. This crashed `@nonlin shoot` and `@@optim lbfgs` (Green's preconditioner) on 2D data.
   - The patch is now only used along dimensions at least as large as the stencil; smaller dimensions use their full extent, so they wrap around correctly.
   - The kernel is identical to a full-lattice computation for all shapes, and unchanged on regular lattices.
4. **`grid_inv`** passed a single-channel Hessian to the multigrid solver, which only handles symmetric D(D+1)/2 layouts. It always failed, including in 3D, so every `@nonlin smalldef` registration crashed when writing its outputs.
5. **Linear-elastic regulariser**
   - The unweighted `lame_shear` computed the off-diagonal strain as `d_i x_j + d_j x_i / 2` instead of `(d_i x_j + d_j x_i) / 2`. It was therefore not self-adjoint, and differed from the weighted path and from `lame_shear_kernel`. **This term is part of the default regularisation of every nonlinear registration**, so the Gauss-Newton systems solved by CG were not symmetric.
   - The 3D `lame_div_kernel` included mixed derivatives along unrelated pairs of axes (kernel-based solvers).
   - `_inv2` (2×2 inverse used by `greens`) transposed the off-diagonal terms. Together with the shear bug, the 2D Green's function did not invert the regulariser (27% error), which distorted 2D geodesic shooting.

## Behaviour changes

- **Default regularisation:** registrations with the default regularisation change slightly, because of the shear fix.
- **Relaxation solver:** it is now stable, but still converges slowly, because its bending diagonal is overestimated (up to about 7× at non-unit voxel sizes). It is not the default solver, and this is not addressed here.
- **Geodesic shooting:** `@nonlin shoot` now runs in 2D. It is still sensitive to how the velocity is transferred between pyramid levels: its geodesic depends strongly on interpolation artefacts in the upsampled velocity. Not addressed here.

## Results

On synthetic 2D pairs (SynthMorph-like labels, label-based Dice loss oracle), together with the companion PR #142:

| model | Dice before | Dice after |
|---|---|---|
| svf | 0.53 (no motion) | 0.953 |
| smalldef | crash | 0.955 |
| shoot | crash | 0.907 |

## Tests

`pytest nitorch/tests/test_register_*.py test_grid_solvers.py test_compute_fov.py test_diff_div.py test_grid_loss*.py test_optinorm.py`: 910 passed, 17 skipped (master merged in).

🤖 Generated with [Claude Code](https://claude.com/claude-code)

https://claude.ai/code/session_014dBjaVf62L1EXi9GATc5cD

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7cc8c35fafb8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.