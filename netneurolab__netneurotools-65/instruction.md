# Issue

**Title:** [FIX] Fixes parcel dropping in nntools.freesurfer

## Description

When names in `drop` parameter weren't present in provided annotation files the function(s) would errored; this is now resolved.

Also adds a new parcel to drop by default commonly found in CBIG parcellations (`'Background+FreeSurfer_Defined_Medial_Wall'`).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b9ab7ab1dda6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.