# Issue

**Title:** Add node to check for subject's Freesurfer directory

## Description

.

Changes proposed:

- Add a node to `init_surface_recon_wf` that is only called if `--fs-no-resume` is used. This node checks if the subject's Freesurfer directory exists and raises an error if it does not.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `da4ee07e0883`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.