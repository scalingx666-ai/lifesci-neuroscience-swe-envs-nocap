# Issue

**Title:** ENH: Enable resampling morphometrics to fsLR CIFTI-2 files

## Description

Currently inaccessible to smriprep itself because I don't want to add and test a CLI option. Could probably go into a bug-fix release if someone cares about it before the next minor release.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e1f4e3b45511`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.