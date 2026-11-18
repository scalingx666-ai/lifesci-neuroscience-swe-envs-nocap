# Issue

**Title:** [ENH] Add a bad channel detection method using LOF algorithm

## Description

Reference issue
NA

What does this implement/fix?
This PR contains a new feature for bad channel detection using Local Outlier Factor (LOF) algorithm.
File name: lof.py
To be compliant, I also added the test_lof.py file along with the test data lofdata.mat

Additional information
The proposed algorithm is used in Newborns EEG Artifact Removal (NEAR) pipeline published earlier this year. Recently, we analyzed data from adult subjects and the algorithm is adaptable to different populations.

Best regards,
Velu

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5e95ee57872a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.