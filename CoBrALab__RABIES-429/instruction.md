# Issue

**Title:** Documentation

## Description

<!-- This is an auto-generated comment: release notes by coderabbit.ai -->

## Summary by CodeRabbit

* **New Features**
  * Group ICA analysis now supports specifying a background image for improved processing.

* **Documentation**
  * Updated terminology in multiple documentation sections to use "root-mean square (RMS)" instead of "L2-norm" for metric and normalization descriptions.
  * Clarified normalization formulas and updated related explanations.
  * Removed documentation entry for the `background_masking_fig/` output folder.

* **Style**
  * Revised plot labels and comments to reflect the use of RMS instead of L2-norm.

<!-- end of auto-generated comment: release notes by coderabbit.ai -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ad963947ac22`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.