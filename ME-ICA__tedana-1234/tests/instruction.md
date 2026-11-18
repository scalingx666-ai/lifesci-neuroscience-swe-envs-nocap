# Issue

**Title:** Fixing unflipped PCA component weights

## Description

Closes # 1233.

I noticed that ICA components where different after #1212 was merged. @tsalo noticed the bug was that, in `decomposition.tedpca` we flipped the component mixing matrix time series in `collect.generate_metrics` but, `voxel_comp_weights` was not flipped. This slipped past because we were focused on this change for ICA. For ICA and PCA, the weight map is calculated saved to a file within `collect.generate_metrics`, but we didn't notice that a PCA weight map that was previously calculated in `decomposition.tedpca` was the one that was returned & used.

Changes proposed in this pull request:

- The "optimal sign" values (1 or -1) calculated in `collect.generate_metrics` is used to flip the signs for components in `voxel_comp_weights`

**Note 1** Please take a look to confirm nothing else needs flipping. I'm fairly sure it's only `voxel_comp_weights` but more eyes on this is good.

**Note 2** If we agree this is both a bug and this PR fully fixes it, I'd like to release version 25.0.1 ASAP. Please comment on this.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b852db0af56d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.