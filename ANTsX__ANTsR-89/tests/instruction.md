# Issue

**Title:** save.ANTsR: full paths enabled, allows save-load-save; plot: fixed alpha

## Description

1. Now supports loading, manipulating and saving sessions in the same folder. Files are not copied if not necessary.
2. All filenames are converted to full paths when loaded, so the user can change working directory without affecting the manipulation of objects.
3. Fixed a bug that did not take in account clonediskfiles=F

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ba9a28af5bed`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.