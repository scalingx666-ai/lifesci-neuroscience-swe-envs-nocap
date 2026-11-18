# Issue

**Title:** Remove GTK dependency for use on headless nodes

## Description

Hi Chris,

Thanks for the great package! One challenge we've faced is that the package imports RGtk2 and cairoDevice even though these are only used, to my knowledge, for the GUI. We are using the package in a cluster environment mostly for computation, not visualization. I removed the dependency and load the packages when the GUI is requested. This seems to keep things functioning, but allow most of the package to work without GTK etc.

Best,
Michael

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6449a6f105bf`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.