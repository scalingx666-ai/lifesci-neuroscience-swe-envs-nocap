# Issue

**Title:** FIX(register): gaussian pyramid filter FWHM sqrt(3); tests for pyramid affine/data consistency

## Description

## Summary

Part of #114. This PR does two things:

1. **Tests documenting affine/data consistency of the pyramids** (no library change). After review, the velocity is not resliced onto the image lattice: the voxel-to-world affines connect the two lattices. The earlier reslicing commit is reverted in 087ea5db.
2. **The Gaussian image pyramid's filter width is fixed** (7a3342e5): FWHM `sqrt(3)` instead of `1`.

## 1. Affine/data consistency (master is consistent)

- **`Displacement.{down,up}sample`** (`resize_grid(anchor='edges')`): the data and the affine use the same per-axis map. This holds for odd sizes (voxel-size ratio N/ceil(N/2)), singleton axes, and axes that become singleton. The displacement is rescaled by the same scale. The world-space transform is kept to about 1e-14 mm, and so is the world field of view.
- **Image pyramid** (ramp test): the data sits where the affine says (gauss, average, stride). The median's 0.5 offset is an intensity bias from the lower-median convention of `core.math.median`, not a geometric error.
- **Level offsets** between the velocity and the gauss/stride images are −(1 − 2⁻ⁿ)/2 coarse voxels (−0.25 at level 1, −0.375 at level 2), and 0 with average pooling. These are what the two operators imply, and the `right` affine absorbs them. Gradients match finite differences.

The border attenuation from the zero-boundary sampling of the velocity on the fixed lattice is real but separate. The options and a recommendation are in the previous version of this description; nothing is implemented here.

## 2. Gaussian pyramid FWHM

The old comment said that adding a 1-voxel FWHM to a native PSF of FWHM 1 gives a PSF of 2 voxels. FWHMs add in quadrature, so it gave sqrt(2). A filter of FWHM sqrt(3) gives sqrt(1 + 3) = 2 fine voxels = 1 coarse voxel, so every level has a PSF of one of its own voxels. Change in `ImagePyramid._build_pyramid`: `fwhm=_GAUSS_PYRAMID_FWHM = sqrt(3)`, with a corrected comment.

**Kernel and padding.** `spatial.smooth` (left unchanged) builds the Gaussian convolved with the linear basis of the samples:
- the kernel grows from **5 to 7 taps**;
- the variance is 0.708 = 3/(8 ln 2) + 1/6, against 0.344 before;
- padding stays 'same'.

The output shape is unchanged (ceil(N/2) for N = 16, 17, 9, 2, 1), and coarse voxel j still sits on fine voxel 2j. `affine_conv(kernel=3, stride=2, padding='auto')` gives the same map for any odd kernel, so the affine was already exact. `_build_affine_pyramid` now passes the actual kernel size (7) for clarity.

**PSF measured.** This is the added variance of a well-sampled blob (σ = 5 fine voxels) at the positions given by each level's affine, minus the linear-basis term. It assumes a native FWHM of 1.

| | level 1 | level 2 |
|---|---|---|
| before (fwhm = 1) | 0.704 coarse vx (predicted √2/2 = 0.707) | 0.608 (predicted √6/4 = 0.612) |
| after (fwhm = √3) | **0.9999** | **0.9999** |

**Other call sites.** No other copy of this convention exists:
- `ImagePyramid` is only built in `pairwise_makeobj.make_image`, which serves `register` and the CLIs that wrap it.
- `autoreg` has its own average-pooling pyramid.
- `affine_tpm` subsamples by spacing and has no pyramid filter.
- No other `smooth(..., stride=2)` exists.

## Tests

- `nitorch/tests/test_register_pyramid_affines.py`: 28 tests, about 3 s.
  - Transfers keep the world transform and the field of view.
  - Image-pyramid ramp check: now skips 2 voxels at each border, the support of the wider kernel, and adds shape 33×32×1.
  - Level offsets.
  - Finite-difference gradients at a coarse level.
  - New `test_gauss_pyramid_psf`: FWHM of 1 coarse voxel within 0.02 at levels 1 and 2. It fails on master (0.70 / 0.61).
- Fast register set (`test_register_*.py`, `test_line_search.py`, `-m "not slow"`): **1082 passed, 1 failed, 2 skipped, 33 deselected**.
  - The failure is `test_register_emmi.py::test_emmi_auto_bins_coarse_level_ordering`. It asserts the premise that 256 fixed bins overfit at level 3 (4³ voxels), i.e. some wrong shift scores lower than the true shift.
  - With the smoother pyramid that premise no longer holds:

    | shifts [0, 2, 4, 8] | level 3, 256 bins | level 3, auto bins | level 2, 256 bins | level 2, auto bins |
    |---|---|---|---|---|
    | master | [−0.527, −0.601, −0.614, −0.412] | J = 2, [−0.0805 ×3, −0.0802] | [−0.388, −0.356, −0.319, −0.235] | [−0.188, −0.152, −0.143, −0.070] |
    | this PR | [−0.928, −0.834, −0.778, −0.622] | J = 2, [−0.0805 ×3, −0.0523] | [−0.474, −0.419, −0.363, −0.273] | [−0.204, −0.176, −0.154, −0.073] |

    With this PR the 256-bin curve is monotone and its minimum is at the true shift.
  - The auto-bin assertions still hold. The test is not modified; the PR leaves the premise to decide on.
- Registration CLI tests (`test_cli_affreg`, `test_cli_simplereg`, `test_cli_register_options`, `test_cli_velocity_bounds`, `test_bounds_zero`): 212 passed.
- Slow register tests (`--runslow`): **29 passed, 2 failed**.
  - `test_register_powell.py::test_register_nonlin_powell_error` also fails on master (DID NOT RAISE). It is not related to this change.
  - `test_register_optim.py::test_register_affine_ogm` fails with this change and passes on master. With `@@optim ogm`, the first steps at level 2 gain only about 3e-4. On master the fourth iteration then jumps (gain 0.016) and recovers the transform: rotation −0.0813 against −0.0799, shift (−1.576, 0.881, −0.499) against (−1.575, 0.877, −0.5). With this PR it stops after 1–2 iterations at every level and returns almost the identity: rotation 0.008, shift (−0.02, 0.01, −0.006). So OGM's stopping criterion is fragile and the smoother coarse levels tip it over. The tolerances are not loosened.

## Found, not fixed here

- OGM affine early stopping (above).
- The premise of the emmi coarse-level test (above).
- `Nonlin2dModel.{down,up}sample` crash (wrong constructor signature); the in-place versions crash for shoot once a kernel is set. These happen on master too.
- The median pyramid's lower-median bias.
- Finite-difference checks of `do_vel` at exactly zero velocity are unreliable, because linear-interpolation kinks sit exactly at the nodes.

## Update: emmi coarse-level test (13fe0e6e)

`test_emmi_auto_bins_coarse_level_ordering` no longer asserts that 256 fixed bins overfit at level 3. With the PSF fixed, the 256-bin values at shifts [0, 2, 4, 8] are [−0.928, −0.834, −0.778, −0.622]: they rise with the shift and the minimum is at the true shift. The `J == 256` check, the auto-bin assertions (J = 2, no spurious minimum) and the level-2 assertions are unchanged. The docstring now says this.

## Update: `test_register_affine_ogm`, diagnosis (not fixed yet, decision pending)

The cause is **not** OGM's stopping logic, and the failure is not specific to OGM:

- **Every first-order optimiser fails, on master too.** On master, `nes`, `gd` and `lbfgs` all return roughly the identity: error 0.071–0.072 on the linear part and 1.55 on the shift. `ogm` passes on master only by luck. At level 0 its first Wolfe line search extrapolates to 926× the trial step (3.75 vox), which jumps the iterate out of a trap. `gn` passes on both branches (error 0.0012 / 0.002).
- **The root cause is a discontinuous objective.** The moving image's mask is pulled with `extrapolate=False`. A sample more than 0.05 voxel outside the field of view gets mask 0 (`inbounds_mask`, `tiny = 5e-2`). When a voxel crosses the edge of the field of view, its term drops out of the masked *mean* of the MSE, so the loss jumps by about (r_i² − MSE)/N. The gradient does not see these jumps. The phantom is non-zero at the edge of its field of view (about 0.26 on the y faces), so the jumps are large.
  - Along a line search the loss decreases smoothly until it reaches a jump. The Wolfe search stops just before the jump, e.g. f(30.91) = −1.74970, f(30.92) = −1.74941.
  - The next direction is almost the same (cos ≈ 1 with −g), so the next search hits the same jump almost at once: f rises by 2.9e-4 within a = 1e-3. The search returns a ≈ 2e-5, and the loss and displacement tolerances then stop the level.
- **Check of the cause.** I monkeypatched `Image.pull` so that the moving image is extrapolated and the in-bounds mask tapers linearly to 0 over the voxel outside the field of view, which makes the loss continuous. With that patch, `ogm`, `nes`, `gd` and `lbfgs` all pass the test's tolerances (linear 0.0018–0.0021, shift 0.0034–0.0064), with 26–40 iterations at level 1 and 10–15 at level 0. `gn` is unchanged (0.0012 / 0.0020). With a hard 0/1 mask instead of the taper, the results match the current code exactly, digit for digit.
- **A secondary effect (stopping, all first-order methods).** At level 2 the first step is `lr = 1e-3` times the gradient. Strong Wolfe accepts the first trial, because of a gradient kink at exact-node sampling: the directional derivative is −3.84e-4 at a = 0 and −2.8e-4 for any a ≥ 1e-4, although the loss stays linear out to a = 30. That step moves 0.000992 vox, which is below `AFFINE_DISP_TOLERANCE = 1e-3`, so level 2 stops after one iteration. Fixing this alone does not fix the test: with `-d 0`, level 2 runs 3 iterations and then sticks at a jump in the same way.

The fix belongs in the forward model (how samples outside the field of view enter the loss), not in OGM. It changes every registration, so it is left for a decision. The options are in the session report.

## Update: OGM slow test fixed by #283

Decision taken: the fix is the continuous field-of-view mask, in a separate PR, #283 (against master). I checked it merged with this branch's pyramid change: `test_register_affine_ogm` then passes (linear 0.0025, shift 0.0036). `nes`, `gd` and `lbfgs` pass as well (linear 0.0024–0.0027, shift 0.0032–0.0051). Once #283 is merged, this PR's slow failure goes away; nothing changes here.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

https://claude.ai/code/session_01MHwEa9dAf8MwawzzozKLzE

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a07ff2bb8a4f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.