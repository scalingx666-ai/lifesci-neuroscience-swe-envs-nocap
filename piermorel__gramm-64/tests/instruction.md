# Issue

**Title:** Set linewidth for fill_abline functions

## Description

Methods that use `fill_abline` were unable to set the line width since `set_line_options` does not interact with any `fill_abline` settings. This commit made changes to `geom_abline`, `geom_hline`, and `geom_vline` so that the line width can now be set when 'linewidth' name/value pair is used in the method.

This change required additional changes to the following files:
1. A change to `gramm` to include linewidth in the abline struct
2. A change to `fill_abline` to accept linewidth name/value pair
3. A change to `draw` to pass the 'LineWidth' name/value pair to the plotting function

It's just a minor change, but I had a need for this so I thought I'd share in case others found it useful.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0238960be75c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.