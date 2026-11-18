# Issue

**Title:** Shader updates & house keeping

## Description

* Updated electrode geometry to allow rigid transform
* Updated electrode material to standard material
* Updated slice shaders to plot outlines of patches
* Updated volume renderer to use data texture shader rather than uniforms for color-ramps
* Slice shader super-resolute the image by 4 rather than infinite to account for oblique rendering
* Removed `raveio` from source code/comments

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `74c72618831a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.