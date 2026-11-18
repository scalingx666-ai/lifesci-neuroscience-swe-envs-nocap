# Issue

**Title:** Avoid underscored function variants

## Description

Hi there, we are working on the next version of dplyr and your package was flagged in our reverse dependency checks.

Your package uses one of the "underscored" versions of a dplyr verb, such as `mutate_()` rather than `mutate()`. These were deprecated in 2017, and are now defunct and must be removed.

dplyr will be released on January 31, 2026. If you could please send an update of your package to CRAN before then, that would help us out a lot! Thanks!

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cc9dff1585c3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.