# Issue

**Title:** BUG: Fill the warped moving mask with 0, not the image background value

## Description

Fill the warped moving mask with 0 instead of BRAINSFit's intensity background value, which overflows the `unsigned char` mask and can mark voxels outside the moving image as inside the mask for the B-spline stage.

<details>
<summary>Root cause</summary>

After the linear stages, `BRAINSFitHelperTemplate::Update()` resamples the moving image mask into the fixed space with `GenericTransformImage<MaskImageType>(..., m_BackgroundFillValue, "Linear", false)`. With `binaryFlag == false` the fill value is used for voxels mapped from outside the mask. `m_BackgroundFillValue` is an intensity value (a `double`); the mask pixel type is `unsigned char`. `BRAINSFitTest_BSplineScaleRotationHeadMasksUShort` passes 10000, so the conversion is out of range, which is undefined behavior. On arm64 it saturates to 255, so every voxel outside the moving image counts as inside the moving mask. Outside the moving image is outside the mask, so the fill is now 0.

Found by an AddressSanitizer/UndefinedBehaviorSanitizer build of the inner project (`float-cast-overflow` at `BRAINSFitHelperTemplate.hxx:1415`).

</details>

<details>
<summary>Testing and AI disclosure</summary>

macOS inner Release build (AppleClang), on current `main` together with the follow-up style commits: no errors; full `ctest` passes. Under `-fsanitize=address,undefined` with this fix, all 549 non-BCD tests pass; without it, the UShort test aborts. The existing BRAINSFit baselines still match, so the change does not move any tested output. `pre-commit run --all-files` passes.

Claude Code (claude-opus-5-5) found the defect while bringing up the sanitizer build and wrote the one-line fix; the author reviewed it.

</details>

<!--
provenance: claude-code session 2026-10-29
post_merge_action: open the sanitizer-leg PR (branch comp-ci-weekly-sanitizers), which depends on this fix
-->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `633100231515`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.