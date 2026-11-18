# Issue

**Title:** fix for pointdensity

## Description

Fix for  following discussion at 

@adamltyson , @vigji , brainrender has a `actors.points.PointDensity` class that creates 3D density plots from a set of coordinates:
<img width="930" alt="image" src="https://user-images.githubusercontent.com/17436313/144138705-496ad2ad-a666-48a6-b183-a904254e304a.png">


This was broken and now I've fixed it, but it's kind of an ugly fix. 
Brainrender normally mirrors meshes on the AP plane to keep the axes orientations consistent with other brainglobe software (a real pain btw). To make the rendering work, the meshes normals need to be recomputed after the transformation. For `PointDensity` I can't do this since the `vedo.Volume` actor it produces cannot recompute normals, so I can't apply the transform or it will look horrible.
The only solution I've found is to mirror the coordinates of the points before these are used to create the `PointsDensity` actor, but that's not very elegant. I'm also not sure if this would work correctly for atlases with different orientations.

What do you guys think? Any idea for a better fix?

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `35ad88466f5f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.