# Issue

**Title:** Feature/wireframe

## Description

Updated for #421
@jefferis: 

1.  Along with this implementation I have also fixed a bug in commit 3cf85f0
which can be reproduced as follows:
```
nclear3d()
plot3d(Cell07PNs[[2]],col='blue',add=FALSE)
```
2. For the wireframe implementation, I have made a new function `wire3d` that masks the function with the same name from `rgl` and will pass the call to either `rgl` or `plotly` dependent on the option of `nat.plotengine`.
3. Currently works for triangle meshes but the approach can be easily extended for quad meshes as well.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6c7f84485191`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.