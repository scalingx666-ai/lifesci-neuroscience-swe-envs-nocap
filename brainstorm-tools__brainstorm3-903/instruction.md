# Issue

**Title:** Rotate/translate cylinder mesh to endpoints

## Description

Due to issues with the orientation of the cylinder mesh during generation, new changes are proposed.
Generate the canonical cylinder mesh along the Z axis (always works), then compute a rotation that maps Z to the desired direction (c1-c0) using a cross-product / Rodrigues construction

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `98a7501915cc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.