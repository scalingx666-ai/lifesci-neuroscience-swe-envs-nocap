# Issue

**Title:** BUG: Initialize velocity-field resample spacing/size on the time axis

## Description

Initializes the time-axis spacing/size when resampling a time-varying velocity field in `ANTSImageRegistrationOptimizer::ExpandVelocity`. Surfaces as a GCC 14 `-Wmaybe-uninitialized` warning (via `ResampleImageFilter::SetOutputSpacing`).

<details>
<summary>Root cause</summary>

`outputSpacing` / `outputSize` span the full velocity-field dimension (spatial + time), but the fill loop only writes the `ImageDimension` spatial entries, leaving the trailing time-axis element uninitialized before it is handed to the resampler. Seeding the outputs from the input field keeps the time axis at the input spacing/size; the loop then overwrites the spatial dimensions as before.
</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d2fbf8bd525f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.