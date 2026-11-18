# Issue

**Title:** add zlib to wasm compile command and bump version

## Description

This PR adds zlib to the `emcc` compile command for the `wasm` target. Now the wasm module can produce `.nii.gz` files if requested. However, this is quite a bit slower in my limited testing.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c9617a879395`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.