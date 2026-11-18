# Issue

**Title:** Updated to new panel specs in spm_results_ui

## Description

Since R2025a, `BorderType` can only be `line` or `none`, and `ShadowColor` is deprecated in favor of `BorderColor`. Warnings disappear after making these substitutions.

More info at official docs: https://www.mathworks.com/help/matlab/ref/matlab.ui.container.panel.html  
(see section "Version History")

Tested on Debian 13 only.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4a67d9208314`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.