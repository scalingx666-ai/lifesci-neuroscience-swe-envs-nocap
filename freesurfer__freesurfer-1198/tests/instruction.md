# Issue

**Title:** nf: synthseg/easyreg autocrop

## Description

In cases where the Field of View (FOV) is set too large on low resolution volumes, resampling to 1mm iso in synthseg gives  extremely large tensors (350+ to a side). In such cases the system can struggle to find large enough contiguous blocks of memory leading to 'bad alloc' errors. In such cases much of the FOV is unneeded and so can be cropped out to reduce memory pressure and compute time. 

Cropping manually with the --crop option requires knowledge of head placement and dimension and is limited to the centre of the FOV. However, synthseg already re-normalises input images and zero's out background noise. Here we've added the --autocrop flag to allow automatic cropping to the smallest bounding box containing everything that is not zeroed out by the normalisation step. 

Additional fixes include:
1. Multi-channel support for resampling using mri_easywarp
2. Handling of numerical roundoff when matching cortical parcellation labels in mri_easyreg

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6dd9721a600e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.