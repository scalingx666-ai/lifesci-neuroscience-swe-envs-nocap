# Issue

**Title:** Modernize _parse_ext to handle multi-extension filenames

## Description

Related to #1528 
Towards #1268

`_parse_ext` splits a filename into its stem and extension. It already contained a special case for `.nii.gz` files. here I refactor it to generally handle multi-extension filenames (EDIT: because I need `_parse_ext` to handle `.tsv.gz` files).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fd50d45172ff`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.