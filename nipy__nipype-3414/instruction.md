# Issue

**Title:** [FIX] Import error for nipype.interfaces.dipy.base

## Description

This PR should fix the import issue with the DIPY interface. DIPY project introduces a new deprecator decorator which was not well handled by  `inspect.getfullargspec()`. So,  I just replace `inspect.getfullargspec()`  by `inspect.signature()`. 

fix #3411
fix 

Could you test this PR  @koenhelwegen  @HippocampusGirl? Thank you.

## Acknowledgment

- [x] I acknowledge that this contribution will be available under the Apache 2 license.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f756b7111749`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.