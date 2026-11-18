# Issue

**Title:** FIX: Update metadata for qmri_qsm and genetics_ukbb

## Description

* QSM had part-phase_T1w.nii.gz with no `Units` metadata.
* UKBB had nonsensical slice-timing. Fixed according to https://www.fmrib.ox.ac.uk/ukbiobank/protocol/V4_23092014.pdf

.
.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e857597f128b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.