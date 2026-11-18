# Issue

**Title:** Add option to generate primitive surfaces

## Description

Feature: Add tess_primitiveShape for generating surface meshes of basic geometric primitives (sphere, box, cylinder, cone, ellipsoid). 
This function uses Iso2Mesh to interactively generate triangulated surface meshes for common 3D shapes. It prompts the user for shape-specific parameters and visualizes the resulting mesh. 

Supports primitive types: sphere, box, cylinder, cone, and ellipsoid. Meshes are cleaned and reoriented, then added to the BST db. This feature allows the creation and simulation of user-defined electrodes (shapes) and can be extended for other applications

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8de32a0f3135`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.