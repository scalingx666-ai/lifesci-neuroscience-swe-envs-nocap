# Issue

**Title:** ENH: Add inputs to mrtrix3.DWIPreprocInputSpec and remove mandatory annotation for pe_dir

## Description

<!--
4. Run `make check-before-commit` before submitting the PR.

-->
## Summary
Simply removed the "mandatory" tag from pe_dir keyword argument as it isn't really mandatory, for example when using rpe_header (in which dwifslpreproc will read the pe_dir from the associated metadata)

 .

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3b505327f412`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.