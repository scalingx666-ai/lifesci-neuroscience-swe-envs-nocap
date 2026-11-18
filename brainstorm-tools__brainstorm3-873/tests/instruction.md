# Issue

**Title:** Anat: Add Boolean operations for surfaces

## Description

Introduces tess_boolean.m to perform boolean operations (union, intersection, difference) on two surface meshes using surfboolean. Adds a 'Surface Boolean Operations' menu item in the tree context menu when two surfaces are selected, enabling users to combine surfaces directly from the GUI.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `475611ac0ece`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.