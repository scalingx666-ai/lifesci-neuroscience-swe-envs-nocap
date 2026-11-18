# Issue

**Title:** ENH: Allow priors to be specified with BIDS labels in ants*CorticalThickness.sh

## Description

Also allow templateflow labels (almost bids but use SCGM instead of SGM).

This lets users run ACT with a templateflow template, eg tpl-OASIS30ANTs, without first renaming the priors 01 through 06.

For backwards compatibility, and because Atropos requires it, output is still numbered 1-6.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c40a681574a4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.