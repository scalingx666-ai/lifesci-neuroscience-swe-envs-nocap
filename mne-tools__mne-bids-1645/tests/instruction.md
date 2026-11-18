# Issue

**Title:** Nest expensive imports to speed up import time

## Description

Sibling PR of  related to  This has a modest effect (~10 ms) but it's easy to include.

Will need a companion MNE-Python PR (forthcoming) for the `fit_matched_points` move, so leaving this in draft mode for now.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `526ee9ddb858`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.