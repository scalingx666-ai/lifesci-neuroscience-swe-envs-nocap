# Issue

**Title:** ENH: Add new flags to MRtrix/preprocess.py (DWI2Tensor, MRtransform)

## Description

## Summary

This PR adds some new flags to MRtrix commands.

Please let me known if anything is missing.

## List of changes proposed in this PR (pull-request)

- [X] Add `-mask` flag for [`dwi2tensor` command](https://mrtrix.readthedocs.io/en/latest/reference/commands/dwi2tensor.html)
- [X] Add `-linear` flag for [`mrtransform` command](https://mrtrix.readthedocs.io/en/latest/reference/commands/mrtransform.html)


## Acknowledgment

- [X] \(Mandatory\) I acknowledge that this contribution will be available under the Apache 2 license.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7080ef9edd0f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.