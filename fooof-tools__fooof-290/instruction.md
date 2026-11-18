# Issue

**Title:** [ENH] - Add options to shade param reconstructions

## Description

Minor update to allow for plotting shades around average for model reconstructions (as mentioned in #227)

Note: this PR is directed to merge into the `time` branch, and then be in 2.0, since it uses the refactored `plot_yshade` function, and so does not easily go into 1.1.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `041067ea8c78`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.