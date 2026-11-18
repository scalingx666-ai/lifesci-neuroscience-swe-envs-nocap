# Issue

**Title:** Philips enhanced survive implicit

## Description

Better support for [unusual](https://www.nitrc.org/plugins/mwiki/index.php/dcm2nii:MainPage#Unusual_MRI) Philips enhanced images with multiple echo, cardiac, dynamic, type [magnitude, phase, real, imaginary] data.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7ab05426b73f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.