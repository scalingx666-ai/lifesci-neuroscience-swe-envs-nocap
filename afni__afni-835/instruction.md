# Issue

**Title:** Sort datasets in dataset choosers

## Description

This update sorts datasets in the AFNI GUI dataset choosers like Underlay and Overlay choosers. Previously, datasets were ordered in an apocryphal order related to their dataset type and their data format with anatomical datasets first, followed by all other types. AFNI format was  included first and then NIFTI and other types of datasets.

The new orders allow for simple alphabetic, reverse alphabetic, dataset type (anatomical, echo planar, functional bucket - a little like the original, but includes NIFTI), or the default order the datasets are read in (close to the original method). I haven't preserved the real original sort, but that could be added in if someone wants that.

Tested with datasets with mixed spaces and formats. Read in new sessions, added new datasets after reading session, used AFNI_GLOBAL_SESSION.

We could make this an environment variable that can be changed within the GUI easily or a sort control within the chooser.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c051ebc95d69`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.