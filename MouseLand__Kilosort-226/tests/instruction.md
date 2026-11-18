# Issue

**Title:** Duplicating KSLabel for clusters into cluster_group

## Description

Duplicates cluster_KSLabel.tsv into cluster_group.tsv, which should be
respected by Phy for things like filtering in the cluster view (e.g.
`group == 'good'`, highlighting in green, etc.).

@marius10p ?

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `baf5e64570dd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.