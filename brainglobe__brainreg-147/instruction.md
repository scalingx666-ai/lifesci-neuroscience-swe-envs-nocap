# Issue

**Title:** Reconcile the `core` and `napari` READMEs

## Description

Reconciles the information found in the two separate READMEs into a single file.

There was a large amount of redundancy in the text, as the `napari` plugin essentially just copied the bulk of its citation and description from the `core` package README.

Note that there is still a reference to `brainreg-segment` in the README here, which will need to be updated to `brainglobe-segmentation`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5add675701bb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.