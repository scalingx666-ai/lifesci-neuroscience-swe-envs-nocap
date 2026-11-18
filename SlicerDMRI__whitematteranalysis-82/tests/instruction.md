# Issue

**Title:** Add HemisphereLocation in fiber cluster vtk file

## Description

Hi Lauren, @ljod 

I made changes to the hemisphere separation code to store fiber location information (a pointdata named 'HemisphereLocation')  in the vtk file in the atlas space. In this way, after transforming the fiber clusters back to the original DWI space, we can use this information the perform hemisphere separation.

I have made some updates to the wiki for this, under 

`* wm_separate_clusters_by_hemisphere.py (in atlas space)`
`* wm_separate_clusters_by_hemisphere.py (in subject DWI space)`

In addition, I updated the wiki about the 'rigid_affine_fast' registration for brain tumor patient dataset, under

`* wm_register_to_atlas_new.py`

I added how to transform the fiber clusters back to the DWI space, under

`* wm_harden_transform.py`

Please let me know how do you feel. Thanks!!!!

Regards,
Fan

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d44310a4cf01`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.