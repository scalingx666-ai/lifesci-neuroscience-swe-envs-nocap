# Issue

**Title:** Separated classification from extraction

## Description

PR (addresses #397) contains the following: 

- Separated classification from extraction. Created `classify.py` under `classification` subpackage that applies default/user-specified classifier. 
- Added call to `classify.classify` in `run_s2p.py`. 
- Added regression test to check output of `classify.classify`.
- Removed check for `iscell.npy` from extraction tests. This now is checked in the added classification test.

Picture below: classification doesn't point to extraction anymore. 
![classification_changed](https://user-images.githubusercontent.com/10649054/84716118-28b8b380-af27-11ea-8de5-421797c5b869.png)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7a1f90f87c0d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.