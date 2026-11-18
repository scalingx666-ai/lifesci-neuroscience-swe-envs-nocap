# Issue

**Title:** register: modulate nonlinear regularisation across pyramid levels

## Description

## Summary

Adds `@pyramid -m/--reg-modulation MOD` (`reg_modulation` in `pairwise_run.run` / `run_pyramid`). It multiplies the nonlinear regularisation by `MOD` each time the voxel size of the nonlinear grid doubles:

```
reg[n] = reg[0] * MOD ** log2(vx[n] / vx[0])
```

**The default is `MOD = 1`, so existing behaviour is unchanged** (the same regularisation at all levels). Changing the default is left for a future PR, after careful evaluation. The finest level always uses the user-defined regularisation, and it is restored when the pyramid finishes.

## Motivation

The velocity field is shared across levels and fully re-optimised at the finest level, so only the finest-level objective defines the solution. Coarse levels only provide an initialisation.

- **The regulariser is already consistent.** It is defined in world space (`factor / prod(shape)`, energies in mm), so it is conserved under `upsample_` for membrane and bending alike: within 1–2% for smooth fields.
- **The likelihood is not.** MSE re-estimates its precision at every evaluation (τ = 1/MSE). Near convergence, coarse levels have less noise and fewer unmatchable details than the finest level. Their data term is therefore stiffer: about ×4 at level 1 and ×10 at level 2 on a synthetic 3D image with the Gaussian pyramid. Coarse levels thus end up under-regularised compared with the problem actually being solved.
- **Why a multiplier rather than a per-level factor.** Over-regularising coarse levels is the safe direction, since the finest level adds the detail back. The modulation follows the actual voxel size, not the level index, so skipped levels (`-l 0:5:2`) and odd grid sizes are handled correctly.

## Implementation

- **Per-level update** (`pairwise_run.run_pyramid`): at each level, `_get_modulated_factor` computes the factor, which is then applied to the model (`factor` and `penalty['factor']`), the optimiser's penalty, and the Shoot Greens kernel, which is rebuilt.
- **Voxel-size ratio:** computed as a geometric mean over the axes the pyramid downsamples, so the singleton axis of a 2D registration is ignored.
- **Frozen fields:** a frozen nonlinear model is left untouched.
- **CLI:** the option is in `parser.py` and passed through in `cli.py`.

## Preliminary benchmark (for a future default)

Synthetic 96³ pair at 1.5 mm with a known SVF deformation, MSE, SVF, 4 pyramid levels, default iterations. The objective is the finest-level objective, identical for all settings, so lower is better.

| MOD | objective (noise) | objective (noise + unmatchable detail) |
|---|---|---|
| 1 (default) | −2.392 | −1.276 |
| 1.41 | −2.401 | −1.296 |
| 2 | −2.390 | −1.309 |
| 2.83 | −2.393 | −1.315 |
| 4 | **−2.410** | −1.319 |
| 8 | −2.407 | **−1.319** |

`MOD = 4` is best or within 0.001 of best in both scenarios, but this is one synthetic case, with MSE only, and the finest level was not run to convergence. Real data and other losses (LCC, MI) still need evaluating before changing the default.

## Tests

- New `nitorch/tests/test_register_pyramid_reg.py`. It checks, at each level, the factor seen by the model, the optimiser and the Shoot kernel; that the finest level keeps the user's factor; and that singleton axes are ignored.
- The existing parser, options, misc, optim and symmetric registration tests pass.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

https://claude.ai/code/session_014dBjaU9W1skYK63oGCNFx1

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e60f9e4ae067`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.