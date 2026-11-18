# Issue

**Title:** FIX: Conditionally drop derived volumes from DWI sequences

## Description

#795 cast a wide net, based on Phillips DICOMs that concatenated derived volumes to diffusion series. This causes problems for Siemens sequences where only derived volumes are contained in an image.

This is a pretty minimal fix that changes the rule to "if raw and derived are present, drop derived, otherwise keep whatever we have".

.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `27c24272661b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.