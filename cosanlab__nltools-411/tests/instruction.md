# Issue

**Title:** added isc group functionality

## Description

I added a new isc function for computing group differences. 

It has two methods implemented as discussed in:

Chen, G., Shin, Y. W., Taylor, P. A., Glen, D. R., Reynolds, R. C., Israel, R. B.,
    & Cox, R. W. (2016). Untangling the relatedness among correlations, part I:
    nonparametric approaches to inter-subject correlation analysis at the group level.
    NeuroImage, 142, 248-259.

Default is the subject-wise permutation method, where the group labels are permuted on the full group similarity matrix. We also include the subject-wise bootstrap method, which randomly samples participants with replacement for each group and generates a null distribution based on the differences. Chen et al., find that the permutation method works the best for controlling false positive rate and bootstrap method generally works, but can be more conservative in smaller group sizes.

There are few more small changes to other ISC functions:
1. I changed the keyword to `n_samples` from `n_bootstraps` to be more consistent and accurate
2. I changed the keyword to `return_null` from `return_bootstraps` to also be more consistent and accurate
3. I fixed a small bug in the `matrix_permutation` function which was using random sampling instead of permuting. This is unlikely to have affected anything, but will be more accurate.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `738f9c1b0bba`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.