# Issue

**Title:** STYLE: Compute the FOV test point in double like every other call site

## Description

Request the field-of-view test point in `double`, as every other `TransformIndexToPhysicalPoint` call in BRAINSTools does, instead of computing it in `float` and widening it.

<details>
<summary>Detail</summary>

`BRAINSABCUtilities.cxx` asked `TransformIndexToPhysicalPoint<float>` for the point, then stored it in the image's `double` `PointType` for the bounding-box `IsInside` test. The `<float>` was a leftover from the ITKv5 return-value migration (#592); the other 12 call sites in the tree request `double`. One line changes; the point is no longer rounded to single precision before the test.

</details>

<details>
<summary>Testing and AI disclosure</summary>

macOS inner Release build (AppleClang): no errors. The local build configures no BRAINSABC tests (`BRAINSABCSmallTest` is excluded from CTest), so this is build-verified only; CI runs the same exclusion. `pre-commit run --all-files` passes.

Claude Code (claude-fable-5-1) made the one-line edit from the todo note left by #592; the author reviewed it.

</details>

<!--
provenance: claude-code session 2026-10-28
post_merge_action: remove the BRAINSABCUtilities <float> Future item from .devlocal/todo.md
-->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bbda558f29c7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.