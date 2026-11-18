# Issue

**Title:** [FIX] Changes the type of ConvertScalarImageToRGBInputSpec.mask_file from File to traits.Str

## Description

I am very new at making PR's so please let me know if I missed something formal about the process. I read the contributors guideline and have run the `make check-before-commit` and `pre-commit`. 

## Summary
The problem is described in depth in the linked issue.
The `mask_file` of `ConvertScalarImageToRGBInputSpec` is an optional argument of type `File` with a default value of `"none" ` and `exists=True`.
In some cases, this causes workflows to crash, as the nipype file validation sees that no file name `"none"` exists.



## Fixes
I propose changing the type to `traits.Str`, since the `mask_file` input to the commandline tool is either a string referencing an existing file, or the string `"none"`. Looking at the inputspec, it seems a similar thing was done to another optional input: `custom_color_map_file`. 

## Acknowledgment

- [x] \(Mandatory\) I acknowledge that this contribution will be available under the Apache 2 license.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `201a13f9b00f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.