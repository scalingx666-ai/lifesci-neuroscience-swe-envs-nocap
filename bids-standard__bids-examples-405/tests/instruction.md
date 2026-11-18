# Issue

**Title:** [ENH] Add example dataset for MRI chunk entity

## Description

This PR adds an example dataset for the MRI chunk entity.

The "chunk" entity is added to the MRI datatype in 

<s>Note that I intentionally did not [truncate](https://github.com/bids-standard/bids-examples/blob/master/CONTRIBUTING.md#how-to-truncate-data-files-to-0kb) the data to preserve its nifti header with qforms for different chunks (FOVs). Instead, I created empty masks of the original images --> images are empty, but the nifti header has been preserved.</s>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c53766c60a10`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.