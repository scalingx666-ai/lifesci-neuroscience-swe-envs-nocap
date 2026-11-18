# Issue

**Title:** RF: Various optimizations to `ImageStim`

## Description

Various improvements to reduce performance degradation due to redundant and costly calls in the rendering pipeline for `ImageStim`.

Includes a global change to disable pyglet's OpenGL debugging feature which affects performance across the app. It can be re-enabled using the new environment variable `PYGLET_DEBUG_GL` in test environments.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ae64993837c9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.