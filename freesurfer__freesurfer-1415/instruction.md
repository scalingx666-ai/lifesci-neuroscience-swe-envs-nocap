# Issue

**Title:** fixed undefined variables in mri_pglands_seg

## Description

fixed bug in _write_vol_stats and _qa_analysis, added map_location to model checkpoint loading

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `53246dc17f1a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.