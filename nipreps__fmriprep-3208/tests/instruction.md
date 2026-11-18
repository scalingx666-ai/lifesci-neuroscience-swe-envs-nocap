# Issue

**Title:** ENH: Leverage T2w if available for BOLD -> anat coregistration

## Description

This PR adds a new parameter `use_t2w` to `init_bold_reg_wf`, which enables/disables using a T2w reference as an intermediate for bbregister.

As long as a T2w is found in the dataset, this option is enabled, as smriprep has already preprocessed and brought the T2w to T1w space.

This PR only changes the behavior of the `bbreg_wf` fork, the FSL workflow remains using the T1w reference.

cc @madisoth as this was inspired based on some comparison work from him

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f719949f5608`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.