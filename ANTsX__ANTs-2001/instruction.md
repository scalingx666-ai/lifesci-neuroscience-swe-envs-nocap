# Issue

**Title:** BUG: Fix principal-axis (Wahba) rotation with the proper polar factor

## Description

Fixes the principal-axis (Wahba) rotation used by `antsAffineInitializer`, `antsAI`, and `ImageMath`. The proper-rotation step was wrong: two sites used an ad-hoc "flip the negative diagonal entries" correction and two used the raw `V·Uᵀ` with no correction at all (silently a reflection when `det = -1`). This replaces all four with the true special-orthogonal polar factor via a small gated helper, and adds the regression test the code path never had.

<details>
<summary>Root cause &amp; evidence</summary>

The attitude matrix `B = Σₖ outer(moving_axisₖ, fixed_axisₖ)` is **rank-deficient by construction** (a sum of outer products, rank `< n`). At the zero singular value the left/right null vectors have independent sign, so `V·Uᵀ` is not a well-defined rotation, and the ad-hoc diagonal-sign fix does not repair it.

Measured over 2000 consistent Wahba problems with a known ground-truth rotation:

| Correction | recovers the rotation |
|---|---|
| old heuristic (both `vnl_svd` and Eigen) | **~52%** (fails ~48%) |
| proper polar factor `R = U·diag(1,…,det(U·Vᵀ))·Vᵀ` | **100%**, backend-invariant |

</details>

<details>
<summary>What changed</summary>

- New `Utilities/antsNearestRotation.h` — `ants::NearestRotation(A)` returns the SO(n) polar factor minimizing `‖R − A‖`. It prefers the Eigen-backed `itk::Math::SVD` when the ITK in use provides it and falls back to `vnl_svd` otherwise; the result is identical either way (the correction cancels the singular-vector sign freedom).
- `antsAffineInitializer`, `antsAI` (both Wahba sites), `ImageMath` now call `ants::NearestRotation` instead of the raw product / diagonal-sign heuristic.

</details>

<details>
<summary>Test plan</summary>

Adds `antsWahbaRotationTest` (fixture-free, deterministic): for several known 2-D and 3-D rotations it builds `B` exactly as the initializers do and asserts recovery of `R`, orthogonality (`RᵀR = I`), and `det(R) = +1`. Verified locally: all cases pass; the previous raw-`V·Uᵀ` approach fails every case, so the test genuinely guards the fix. `git clang-format` against `main` reports no changes to the modified lines.

</details>

<!--
provenance: claude-code session 2026-07-07; part of the vnl->Eigen (itk::Math) campaign.
This is a standalone bugfix, independent of the SVD-migration branches (disjoint files).
breadcrumbs: ~/src/ITK/.devlocal/hints/stage-vnl-eigen-campaign-prs.md
evidence harness: ~/src/ITK/.devlocal/svd-category-a-equivalence/ (wahba3.cxx, wahba4.cxx)
-->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5aaef6c40756`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.