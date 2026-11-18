# Issue

**Title:** Refine Tetra Fem Mesh

## Description

Summary: 
Introduce an interactive GUI that enables users to refine FEM meshes interactively from the GUI. This option would be accessible via the right-click context menu of an FEM mesh node in the database tree > Refine FEM mesh.

Motivation:
This feature is critical for optimizing FEM computations, particularly in cases where localized accuracy is needed (e.g., near electrodes, complex cortical folds, or any user ROI). Targeted mesh refinement helps reduce overall computational load while maintaining precision where it matters most.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `40773f82717a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.