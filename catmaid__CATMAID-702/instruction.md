# Issue

**Title:** Prevent full screen redraws when updating the tile layer (Chrome)

## Description

Provide a hint to Chrome to use textures (likely on the video card) for the tiles, greatly speeding up redraw times.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8f59efd80f37`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.