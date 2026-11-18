# Issue

**Title:** Parallel version of predict_cell_types script

## Description

A parallel version of prepare_dataset and plot_features_1cell_vertical functions have been included. The new prepare_dataset_parallel function produces an error in the execution when all the units in the cluster_group.tsv file are defined as good or noise (there are not unsorted units). That condition will produce a race condition, when several processes will be reading the file cluster_group.tsv, while other ones will be writing the same file (see load_units_quality function in file gl.py). A lock should be introduced in this reading/writing process

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `67e778954bfa`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.