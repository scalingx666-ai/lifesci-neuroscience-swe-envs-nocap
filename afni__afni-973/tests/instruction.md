# Issue

**Title:** add more font files for APQC HTML, and their open licenses

## Description

To reduce potential heterogeneity of font/visualization of the APQC HTML on different platforms, we now include a more complete set of fonts within the distribution itself. Also, the included fonts are all open ones (and modern and pretty nice looking).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `eceae439bd64`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.