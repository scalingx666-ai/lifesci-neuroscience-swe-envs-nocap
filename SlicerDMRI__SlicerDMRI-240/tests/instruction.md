# Issue

**Title:** ENH: add nifti file reader for diffusion scans

## Description

This creates a reader plugin for Slicer that recognizes nii.gz files and offers to read them as diffusion volumes.

Relies on this work:

    Billah, Tashrif; Bouix; Sylvain; Rathi, Yogesh; Various MRI Conversion Tools, https://github.com/pnlbwh/conversion, 2019, DOI: 10.5281/zenodo.2584003

    Supported by NIH Grant 5R01MH119222

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c775e09bb41e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.