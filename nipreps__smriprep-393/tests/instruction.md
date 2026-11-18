# Issue

**Title:** Add --fs-no-resume option to reuse existing freesurfer outputs without resuming (eg. longitudinal pipeline base)

## Description

(Reopen of #371)

For now, it is not possible to run f/sMRIPrep with existing longitudinal freesurfer output.
If I understood correctly, the current surface generation workflow:

runs autorecon1 without skullstripping
injects a custom (and more robust) brainmask.mgz
resume to autorecon2/3 without any other tweaks.

The simpler way I found to input the base/template recon-all is to use the FreeSurferSource and reconnect everything appropriately. Does that make sense, or I missed something (like registering the sMRIPrep generated average to the freesurfer one).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c72116ad7804`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.