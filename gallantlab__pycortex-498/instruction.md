# Issue

**Title:** ENH allow setting curvature values when starting webgl viewer

## Description

Now the curvature brightness/smoothness/contrast can be changed programmatically when starting `cortex.webgl.show`. This will allow changing these curvature values when using `cortex.export.plot_panels`.

(The PR also includes some sorting of the imports done automatically by isort...it doesn't hurt cleaning up the imports a bit.)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `157d4290c49c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.