# Issue

**Title:** BF: Fixed 'add' blend mode for text rendering

## Description

Changes the the shader `TextBox2` uses to allow for correct opacity and color blending when the window is in 'add' mode

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d741d9d7ab45`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.