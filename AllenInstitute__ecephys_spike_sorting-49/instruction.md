# Issue

**Title:** Fix PC metrics in cases where spike_templates != spike_clusters

## Description

Previously, the code assumed that no manual merging/splitting took place prior to calculating the sorting quality metrics. However, if post-hoc manual curation (e.g. in phy) has occurred, the PC features (calculated by Kilosort) will no longer be correctly indexed by the `spike_clusters` array.

These changes fix indexing issues related to this discrepancy, such that PC-based metrics are now correctly calculated when `spike_clusters` and `spike_templates` do not match.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ddd7602a8121`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.