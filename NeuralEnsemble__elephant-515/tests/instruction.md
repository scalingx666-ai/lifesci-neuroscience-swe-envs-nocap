# Issue

**Title:** Fix/add nixio to test requirements

## Description

This PR adds the nixio package to elephants test requirements.

Until now, `.nix`-files and the corresponding nixio were only used for tutorials.  

Since datasets for unit-tests, (more specifically for validation tests) might come as `.nix`-files, this is a neccessary addition.

nixio: https://pypi.org/project/nixio/

This came up in with PR #491, thanks @ojoenlanuca  for the hint.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `df8e96212e12`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.