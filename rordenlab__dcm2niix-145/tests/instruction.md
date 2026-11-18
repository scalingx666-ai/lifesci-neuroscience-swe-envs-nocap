# Issue

**Title:** Please pull SieXA10_Phi5dMRI into master

## Description

Hello,

This branch was triggered by Siemens changing their DICOM format in the switch from VE11 to XA10.  XA10 is currently only found on their Vida scanners, but when I asked Siemens about it they confirmed that XA10 is the next software version after VE11, and they are switching from mosaic + CSA style DICOM to enhanced DICOM.  The new enhanced DICOM is a move in the direction of using more public tags for diffusion info, like Philips, but unlike Philips 4D series are still receiving 1 file per volume.  Those files are enhanced, however, not mosaics.  The Vida also has a "compatibility" mode, but we have not been able to extract diffusion b values or directions from it, and this branch only supports the enhanced DICOM mode.

It also includes some updates to improve dcm2niix's handling of diffusion MRI in either enhanced or unenhanced DICOM from Philips scanners, especially ones running the current software version (5).  Notes have been added to clarify that the "ADC" volume commonly found in Philips diffusion MRI DICOM is likely really a trace volume, i.e. the average of the diffusion weighted volumes.  (Trace volumes do not appear to be made by Philips if there are multiple b values.)

This branch passes the dcm_qa test script if compiled with OpenJPEG, and passes my own test suite that includes enhanced DICOM from Siemens XA10 and Philips 5, and not-enhanced DICOM from various software versions of GE, Philips, and Siemens MR scanners, for various sequences such as MPRAGE, FLAIR,  diffusion, and functional MRI.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `66cdf2dcc60d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.