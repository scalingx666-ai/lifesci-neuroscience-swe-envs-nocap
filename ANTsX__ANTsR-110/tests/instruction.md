# Issue

**Title:** Added Remotes

## Description

As devtools states, if you want to depend on a GH package, you can include in remotes:
https://cran.r-project.org/web/packages/devtools/vignettes/dependencies.html

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `58a9c2d0779d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.