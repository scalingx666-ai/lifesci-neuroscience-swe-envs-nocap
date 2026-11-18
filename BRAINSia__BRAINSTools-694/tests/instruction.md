# Issue

**Title:** BUG: Fix gtractCoregBvalues segfault after the first registration

## Description

Fixes the segfault in `gtractCoregBvalues` () and a malformed first gradient line in its output, and re-enables the tool's test, which had been commented out because of the crash.

- **Crash:** the tool cast the `CompositeTransform` from `BRAINSFitHelper` directly to a rigid or affine transform and dereferenced the resulting null pointer. It now takes the single linear transform out of the composite and checks the cast.
- **Behavior change to review:** gradients are now rotated with the orthogonalized matrix in rigid mode as well as affine mode. Rigid mode fits a `ScaleVersor3D` transform, so the raw matrix would also have rescaled the gradient.
- **Test:** `gtractCoregBvalues_Test` is enabled as a run-to-completion test. It has no output baseline (see below).

<details>
<summary>Local testing (Ubuntu 24.04, gcc 13.3, Release)</summary>

- `ctest -R '^gtractCoregBvalues_Test$'`: passes with this branch (49 s). The unfixed tool exits with signal 11 on the same input, so the test catches the crash.
- A 79-volume single-shell scan (71 directions, b=1000) in rigid and affine modes: both run to completion; all 79 gradient lines parse; output gradient lengths equal input lengths to six decimals; rotations are 0.22 degrees median and 0.66 degrees at most; b=0 rows stay zero.
- `pre-commit run --all-files`: passes.

</details>

<details>
<summary>Why the test has no --compare baseline</summary>

The commented-out test compared the output against its own input image. The tool resamples every volume, so that comparison fails even when the tool is correct (332181 pixels over the intensity tolerance of 20, against an allowance of 1000). A numeric baseline would need a new output image uploaded to the test data store; this PR does not add one.

</details>

<details>
<summary>AI assistance</summary>

Claude Code was used for the root-cause analysis, the code change, and the local test runs listed above. The commits carry a `Tool-Assisted` trailer.

</details>

<!--
provenance: claude-code session 2026-11-12
files: GTRACT/Cmdline/gtractCoregBvalues.cxx, GTRACT/Cmdline/TestSuite/CMakeLists.txt
commits: 6f7e6c0e (crash fix + test), 3d8f8ca2 (gradient separator)
post_merge_action: consider uploading a real output baseline for gtractCoregBvalues_Test
-->

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `506631a013ca`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.