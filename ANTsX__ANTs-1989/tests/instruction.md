# Issue

**Title:** BUG: Initialize time axis of time-varying velocity field in ExpandVelocity

## Description

Fixes a crash in geodesic (time-varying) SyN registration: the `ANTS` program aborts with `ITK ERROR: Failed to allocate memory for image` at a resolution-level transition.

<details>
<summary>Root cause</summary>

`ExpandVelocity()` in `ImageRegistration/itkANTSImageRegistrationOptimizer.h` sizes an `(ImageDimension+1)`-D time-varying velocity field, but its `for (d < ImageDimension)` loop initializes only the spatial axes. The time axis (`outputSize[ImageDimension]` / `outputSpacing[ImageDimension]`) was left uninitialized, so the resampler could request an image of `spatial x spatial x <indeterminate>` extent and abort. The undefined behavior was benign under some builds and surfaced as an `ANTS_SYN_WITH_TIME` crash at the level-0 -> level-1 transition.

The fix copies the time axis from the input field, which is invariant across resolution levels.
</details>

<details>
<summary>Test plan</summary>

`ANTS_SYN_WITH_TIME` and `ANTS_SYN_WITH_TIME_WARP` (previously crashing) pass after the change.
</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d2fbf8bd525f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.