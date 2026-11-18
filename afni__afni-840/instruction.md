# Issue

**Title:** JulichBrain v3.1 atlases

## Description

The latest version of the Julich human brain atlases from the EBrains site seems to fix old errors in non-contiguities, even compared to the previous 3.0.2 versions in the AFNI distributions. There are versions for MNI 2009c and MNI N27 spaces. In the afni GUI, the MNI 2009c version is now the default atlas used for Atlas colors and Go to Atlas location menus (controlled by AFNI_ATLAS_COLORS). The default list of atlases for whereami searches is updated in thd_ttatlas_query.c with the previous version of Julich brain atlases replaced by these latest versions.

AFNI_atlas_spaces.niml specifies which atlases are available, and the version here and the one in pu/dist/atlases/AFNI_atlases_dist and AFNI_atlases_dist.tgz should be the same.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4a24e3118e8f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.