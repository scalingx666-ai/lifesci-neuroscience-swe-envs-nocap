# Issue

**Title:** ENH: Support spatial normalization to alternative modalities

## Description

Builds off #457
Requires 

Adds a new parameter to `init_register_template_wf()`, `image_type`, to allow setting alternative registration targets for spatial normalization.

Also adds a tweak to the antsRegistration call to disable histogram_matching ([which is enabled in most of the preset settings used](https://github.com/nipreps/niworkflows/tree/master/niworkflows/data)), for cases where the reference anatomical and template target differ in modality.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `87e5e88b06b0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.