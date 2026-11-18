# Issue

**Title:** Bugfix: Properly update IsoSurface mesh in database when using `Thresh` slider

## Description

Introduced in a93dcd0

While using `Thresh` slider to update IsoSurface, the `append` mode just updates `Faces`, `Vertices`, `Comment` and `History` fields in database for the mesh, but with the new Faces and Vertices, the other dependent fields must also be computed and updated. Wrong `VertConn`, `VertNormals`, `Curvature` and  `SulciMap` can be seen below.
![Screenshot 2025-05-01 113428](https://github.com/user-attachments/assets/6613abfb-9bf8-4293-84ac-a8942f252bdc)

**Where it affects ?**
In centroid selection mode for IsoSurface, on updating the IsoSurface using the slider, due to incorrect `VertConn` the centroid computation is erratic.

After correction:
![Screenshot 2025-05-01 113741](https://github.com/user-attachments/assets/1056a693-76ae-43c1-b188-9b45cb6b0832)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `41e58895c8e5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.