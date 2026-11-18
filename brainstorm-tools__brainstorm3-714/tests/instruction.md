# Issue

**Title:** Add support for importing FreeSurfer results from 'recon-all-clinical.sh'

## Description

Add support to import the output folder from the FreeSurfer `recon-all-clinical.sh` pipeline

Requested here: https://neuroimage.usc.edu/forums/t/47017

* Description of the files in the output folder:
  https://surfer.nmr.mgh.harvard.edu/fswiki/recon-all-clinical

* The standard transformation FreeSurfer=>Brainstorm required for results from `recon-all` is not needed for results from `recon-all-clinical`
  https://github.com/brainstorm-tools/brainstorm3/blob/master/toolbox/io/in_mri_mgh.m#L140-L146

* Anatomical atlases have a different size, due to padding in `recon-all-clinical.sh`
  https://github.com/freesurfer/freesurfer/blob/fdd7a75ae623db77b33ee32b7c13bd161e3e4815/recon_all_clinical/recon-all-clinical.sh#L225
  
* Updated tutorial page: https://neuroimage.usc.edu/brainstorm/Tutorials/LabelFreeSurfer

- [x] Add support in Brainstorm
- [x] Document in Brainstorm pages

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `16197a9479ee`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.