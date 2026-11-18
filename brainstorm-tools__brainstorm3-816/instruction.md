# Issue

**Title:** Integrate GARDEL's automatic contact localization in Brainstorm

## Description

This PR aims to automatically detect SEEG contacts in Brainstorm using GARDEL tool's automatic detection pipeline.

About GARDEL: [link](https://gitlab-dynamap.timone.univ-amu.fr/public_shared_tools/gardel/-/wikis/home)

Test data: [link](https://drive.google.com/drive/folders/1Kw9hbKVwh47EmBbiH1Z8DhrHHzeKYavt?usp=sharing)

Tutorial (WIP): ~https://neuroimage.usc.edu/brainstorm/Tutorials/AutoContactLocalization~ https://neuroimage.usc.edu/brainstorm/Tutorials/AutoContactLocGardel

***
**Steps to test:**
1. Right click subject > **Import MRI**. Set fiducials and save.
2. Right click subject > **Import CT**, coregister (SPM), reslices, and skull strip (SPM).
3. Right click on **CT_spm_reslice_masked_spm > CT segmentation > Generate threshold mesh from CT**
4. Right click subject > **SEEG/ECOG implantation**
5. Choose **CT+MRI+IsoSurf** (can choose any but this option gives a better visualization as both 3D and 2D open up). 
6. In **Panel iEEG**, at the bottom click **Auto > Gardel**. ~magic~ Gardel's `elec_auto_segmentation` function is called, and the live automatic implantation can be seen.
7. Close figures and click **Save** in the prompts to save the channel data.

@tmedani @samuel.medinavillalon@gmail.com

EDIT: Add clarification on step 2

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7e84e96cf752`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.