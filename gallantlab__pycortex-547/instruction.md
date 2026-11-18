# Issue

**Title:** NF add functions to compute mappers from freesurfer to WebGL

## Description

This PR adds two new functions to compute index mappers from the CTM surfaces to the WebGL surfaces and from the freesurfer surfaces to the WebGL surfaces. These mappers are necessary for creating static viewers based solely on VertexData without volumes attached.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b29502ceef63`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.