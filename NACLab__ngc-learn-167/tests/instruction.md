# Issue

**Title:** Minor nudge to v3.2.1 (given ngc-sim-lib v3.1.1 nudge)

## Description

This version is a minor nudge to v3.2.1, which uses ngc-sim-lib v3.1.1 (minor nudge over there that contains improved deprecator functionality). 

This version also includes some minor mods/patches and some additional support in `ngclearn.utils.analysis.effective_dim` for dimensionality analysis and representational collapse.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5c7acc5a8f22`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.