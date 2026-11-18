# Issue

**Title:** Replace pseudo-z-statistics with standardized parameter estimates

## Description

. .

The old approach did the following to calculate the "weight maps":

1. Calculate standardized parameter estimate maps.
2. Crop the values to -0.999 - 0.999.
3. Fisher's z-transform the values.

The old approach then calculated the "Z maps" by doing the following to the weight maps:

1. Z-score the Fisher's z-transformed values.
2. Crop the values to -8 to 8.

These "Z maps" were treated as valid z-statistic maps, even though they weren't.

Now, we just calculate and use standardized parameter estimate maps. We use a proportional threshold of the top 5% (two-sided) of voxels for cluster-extent thresholding, rather than a hardcoded value threshold of 1.96 (p < 0.05, two sided).

<!-- Please give a brief overview of what has changed in the PR.
If you're not sure what to write, consider it a note to the maintainers to indicate
what they should be looking for when they review the pull request. -->
Changes proposed in this pull request:

- Remove `computefeats2`.
- Calculate standardized parameter estimates by z-scoring the mixing matrix and the data and then using `get_coeffs`.
- Use a proportional threshold for standardized parameter estimate maps (95th percentile, using the absolute values of the maps) instead of a pseudo-z-statistic threshold (1.95) that preserved roughly the same proportion of voxels.
- Modify `tedana.metrics.dependence.threshold_map`, `tedana.metrics.dependence.compute_signal_minus_noise_z`, `tedana.metrics.dependence.compute_signal_minus_noise_t`, and `tedana.metrics.dependence.compute_countnoise` to accept either a value threshold or a proportion threshold from which to calculate a value threshold.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cdef54b6744d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.