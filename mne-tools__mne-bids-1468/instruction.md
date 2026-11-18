# Issue

**Title:** Add `html-noplot` recipe to doc/Makefile

## Description

In our [contributing guide ](https://github.com/mne-tools/mne-bids/blob/main/CONTRIBUTING.md#running-tests)we say that one can do `make html-noplot` to build the documentation without executing the example gallery, but the `html-noplot` recipe doesn't actually exist!


I've also put a lower pin on `sphinx-gallery`, and will elaborate on that in a comment.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9c550e125235`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.