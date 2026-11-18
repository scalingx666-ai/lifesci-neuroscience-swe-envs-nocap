# Issue

**Title:** Add warning for fslr32k histology data resolution mismatch

## Description

Known issue: The fslr32k histology profile data on the server contains fs_LR_64k resolution (64984 vertices) instead of fs_LR_32k (32492 vertices).

- Add warning in read_histology_profile() when template is fslr32k
- Add warning in download_histology_profiles() when downloading fslr32k data
- Reference issue #369 in warnings for users to track the status
- Remove skip for fslr32k test in test_histology.py (netneurotools issue fixed)

This is a server-side data hosting issue. The correct fix requires uploading the proper 32k resolution data file to the server.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `40dd0565b795`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.