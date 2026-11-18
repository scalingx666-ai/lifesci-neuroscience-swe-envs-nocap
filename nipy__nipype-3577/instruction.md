# Issue

**Title:** add contrast outputs for EstimatedModel

## Description

If factorial design is used for fMRI model specification (parameter "factor_info" in Level1design), spm automatically creates contrasts (con*, ess*, spmF* and spmT* images) during model estimation (EstimateModel). 

Those outputs are not yet in EstimateModel in Nipype, the aim of this PR is to add them. 

Issue :

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `68a7cd436eb2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.