# Issue

**Title:** ParallelContext bbs memory leaks

## Description

Notes:
Args were reversed when pycall executed for ```pc.submit(pycall, *args)``` introduced into Version 9. Fixed by f721d61
There was a doc typo with regard to ```NRN_OVERRIDE_LD_PRELOAD```. Fixed by 8fccebb

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `28d36120492c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.