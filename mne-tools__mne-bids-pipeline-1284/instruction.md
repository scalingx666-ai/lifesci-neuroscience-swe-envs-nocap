# Issue

**Title:** Handle decoding contrasts with too few epochs

## Description

.

If either condition contains fewer epochs than `decoding_n_splits`, the subject-level step now saves all-NaN scores with the expected output shape and logs a clear warning instead of running invalid cross-validation.

At the group level, results that are entirely NaN are excluded from the statistics. The saved output and report use the effective sample size and retain the valid subject IDs. Cluster permutation testing is skipped when fewer than two valid subjects remain.

Regression tests cover:

- NaN score shapes for full-epoch, time-by-time, and time-generalization decoding;
- the sufficient-epoch path;
- exclusion of all-NaN subject results while retaining partial-NaN results;
- reports with contrast-specific effective sample sizes.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a679a9fe4439`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.