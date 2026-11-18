# Issue

**Title:** Refact: Refactored code for subject embedding models.

## Description

Improvement to subject embedding models. 

- The code now exploits the fact that each sequence can only come from the same subject and only assign one set of observation model parameters to each sequence.
- This avoids the need to assign memory to observation model parameters (especially covariances) to every single time point.
- Training is ~5 times faster.
- Memory consumption reduced significantly (more than 5 fold and can reach 10 fold in some cases).
- The code decouples memory consumption with the number of subject.
- The code also samples different deviations for different sequences in a batch, which leads to smaller variance of the MC estimator of the gradient during re-param trick.
- The HMM intialisation step is removed from the wrapper as it's no longer needed for convergence purpose due to the above change.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `eff5153d596b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.