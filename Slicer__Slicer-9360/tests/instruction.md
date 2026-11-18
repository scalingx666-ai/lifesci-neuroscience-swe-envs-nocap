# Issue

**Title:** ENH: Scale OBJ mesh coordinates based on unit specified in file header

## Description

Some applications (for example, Materialise Mimics and 3-matic) write the length unit of the vertex coordinates into the OBJ file header as a comment, such as "vertex coordinates are measured in units, where 1 unit = 1000.000000 mm". Vertex coordinates are now automatically scaled to millimeters when such a file is loaded. Only "mm" unit is supported; for any other unit or invalid scale value a warning is logged and the coordinates are loaded without unit conversion.

Added test and documentation. For completeness, also amended the documentation with description of how coordinate system is also read from mesh file header.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fcf4f7b22587`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.