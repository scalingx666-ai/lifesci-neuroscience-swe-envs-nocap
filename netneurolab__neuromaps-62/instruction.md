# Issue

**Title:** [DOC] Update docstrings for null models

## Description

- This Pull Request updates the dosctrings of the null model functions. More
specifically, the docstrings for the `burt2018`, `burt2020` and `moran` null
models now specify that data can be either a Gifti or a Nifti file (and
not niimg_like only). The docstrings also specify that the atlas for these
three models can also be volumetric (i.e. `mni152`).

- The nifti file for the 2009cAsym 1mm brain mask appeared to be
  corrupted (it could not be loaded). I hence re-uploaded the file on
  OSF, and updated the osf.json file accordingly

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8aaa841c3f37`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.