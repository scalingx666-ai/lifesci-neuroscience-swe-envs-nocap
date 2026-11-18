# Issue

**Title:** Add option to calculate valid univariate z statistics in decision tree

## Description

Related to #178. I can do some comparisons between the old and new approaches if anyone wants that.

Changes proposed in this pull request:

- Add function `voxelwise_univariate_zstats`, which calculates valid univariate z-statistic maps for regressors by separately regressing the data on each regressor's time series, rather than running a single regression with  all of the regressors.
    - Based on my understanding, this is not useful for ICA, where the component time series are only valuable in the context of the full mixing matrix, but it could be useful for (1) external regressors or (2) evaluating correlations with removed components after denoising.
- Add metric "map univariate Z statistics" for the valid, univariate z-statistic maps. This is distinct from "map Z" and "map weight", which should be removed and/or renamed ().

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `805de0e62579`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.