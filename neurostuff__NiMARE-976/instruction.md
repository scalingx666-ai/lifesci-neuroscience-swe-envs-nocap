# Issue

**Title:** [ENH] optimize ale permutations

## Description

<!---
This is a suggested pull request template for NiMARE.
It's designed to capture information we've found to be useful in reviewing pull requests.

If there is other information that would be helpful to include, please don't hesitate to add it!

Please also label your pull request with the relevant tags.
See here for more information and a list of available options:
https://github.com/neurostuff/NiMARE/blob/main/CONTRIBUTING.md#pull-requests
-->

Several jobs are failing on aws when running ALESubtraction with a large reference dataset, the set amount of RAM allocated is around 30GB, and this requires 80GB+. This pull request reduces the memory (and time) cost of this algorithm. 

<!-- Please indicate after the # which issue you're closing with this PR.
This is helpful for the maintainers AND will magically close the issue when this
pull request is merged!
https://help.github.com/articles/closing-issues-using-keywords -->
Closes # Nothing

<!-- Please give a brief overview of what has changed in the PR.
If you're not sure what to write, consider it a note to the maintainers to indicate
what they should be looking for when they review the pull request. -->
Changes proposed in this pull request:

- Rework ALESubtraction to use masked CSR study-by-voxel matrices and float32 null memmaps to reduce memory use.
- Switch ALE and ALESubtraction permutation execution to thread-backed joblib to preserve shared-memory behavior.
- Replace per-voxel joblib p-value loops in ALESubtraction and SCALE with chunked/vectorized conversions, and tune chunk sizes empirically.
- Stream regular ALE Monte Carlo null-histogram reduction, reuse precomputed histogram edges, and avoid materializing the full permutation-histogram matrix.
- Preallocate and stream regular ALE FWE Monte Carlo permutation maxima instead of collecting permutation tuples in a list.
- Add regression tests covering chunked p-value conversion and streamed ALE Monte Carlo histogram reduction.

## Summary by Sourcery

Optimize ALE- and SCALE-based permutation and p-value computations for reduced memory usage and improved performance, while preserving existing statistical behavior.

Enhancements:
- Introduce shared configuration for permutation parallel backends and chunk sizes for ALESubtraction and SCALE p-value computation.
- Convert ALESubtraction MA maps into masked sparse matrices and support sparse matrix summary-statistic computation to lower memory footprint.
- Refactor ALESubtraction and SCALE p-value calculations to operate in voxel chunks and reuse precomputed histogram edges, reducing per-voxel and per-iteration overhead in Monte Carlo procedures.
- Stream Monte Carlo histogram accumulation across permutations instead of materializing full per-iteration histograms, decreasing peak memory usage.
- Unify and simplify parallel job configuration for permutation-based null and FWE computations in CBMA estimators.

Tests:
- Add tests validating streaming Monte Carlo histogram reduction matches the previous batch behavior.
- Add tests confirming masked sparse ALE summaries are equivalent to the original COO-based path.
- Add tests ensuring chunked ALESubtraction and SCALE p-value computations match the scalar, per-voxel implementations.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5fac65c0eb59`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.