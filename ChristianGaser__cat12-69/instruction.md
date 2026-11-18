# Issue

**Title:** Update dcm2niix of DCM2BIDS to v1.0.20261029

## Description

Updates the dcm2niix release of DCM2BIDS from v1.0.20260724 to v1.0.20261029 ([release notes](https://github.com/rordenlab/dcm2niix/releases/tag/v1.0.20261029)).

The assets of macOS, Linux, and Windows were verified by the SHA-256 digests of the release, and the Linux binary reports v1.0.20261029.

Before merging:
- [x] run `cat_DCM2BIDS_selftest` locally with real DICOM data
- [x] check the dcm2niix warnings (`ConversionWarnings` in the sidecars) and the merged echoes of incomplete field maps (e.g. NKI-RS)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `05e2ac3e2de4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.