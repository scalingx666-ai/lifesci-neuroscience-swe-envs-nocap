# Issue

**Title:** FIX,MNT import surfaces generated from volumes with any voxel size

## Description

This PR fixes the bug first described in #300. Pycortex always assumed that the surfaces were generated out of T1s with 1mm3 isotropic voxel size. If one imported surfaces generated from other volumes (e.g., sub-mm), then the surfaces would be misaligned (see example in #300). To fix this issue, here I'm simply importing and converting the surfaces to gifti with Freesurfer's `mris_convert --to-scanner`, which uses the same coordinate system as the T1 rather than the TKR system used for surfaces. 

This change produces the same surfaces as the old code for 1mm3 volumes. I'm waiting for freesurfer to finish on a sub-mm volume to test it there too.

(This PR also cleans up the code in that function a bit to make it easier to maintain...)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `59a6f5b5e060`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.