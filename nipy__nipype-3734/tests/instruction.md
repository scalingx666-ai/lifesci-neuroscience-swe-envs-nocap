# Issue

**Title:** Fix SPM output type for version 25

## Description

## Summary

Fixes # .

Updated the `_list_outputs` method in `nipype.interfaces.spm.base` to handle SPM version 25 correctly. Previously, the code only checked for SPM12 when determining the output file type (`nii` vs `img`). Now, both SPM12 and SPM25 are treated as using `nii` format.

## List of changes proposed in this PR (pull-request)
- [x] Modified `_list_outputs` to use:
      ```python
      outtype = "nii" if self.version.split(".")[0] in ["12", "25"] else "img"
      ```
- [x] Verified that output type defaults to `"nii"` for SPM version 25.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8234ec318489`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.