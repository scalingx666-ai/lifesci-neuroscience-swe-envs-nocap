# Issue

**Title:** BUG: Disable pip install UI off main thread

## Description

See also
- https://discourse.slicer.org/t/nninteractive-slicer-client-is-stuck/47550/9
- https://discourse.slicer.org/t/2026-07-07-weekly-meeting/47523/9
- 

While  fixes the issue in SlicerNNInteractive, until extensions are updated this PR introduces a failsafe to `pip_install`: if `pip_install` is being called from outside the main thread, then refrain from making Qt objects.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `28ef15df2165`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.