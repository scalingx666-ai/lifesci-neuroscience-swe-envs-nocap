# Issue

**Title:** [ENH] Adds `noplot` param to plot_fsaverage()

## Description

.

The `noplot` parameter accepts a list of parcel names that should not be plotted. By default, 'corpuscallosum' and 'unknown' are included in this list (due to their inclusion in all default FreeSurfer parcellations), but additional regions can be added.

Also allows plotting to arbitrary subjects (not just `fsaverage`) via the `subject` parameter.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `374545109de9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.