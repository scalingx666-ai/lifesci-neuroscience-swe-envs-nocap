# Issue

**Title:** Update syntax to match nilearn 0.7

## Description

Thanks for sharing this script!

I had a minor hiccup because `nilearn 0.7` has moved `plot_design_matrix` from `nilearn.reporting` to `nilearn.plotting` [[ref]]().
This PR updates the syntax.

Alternatively, the dependency could be pinned to keep using an older version of nilearn.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `82985669321d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.