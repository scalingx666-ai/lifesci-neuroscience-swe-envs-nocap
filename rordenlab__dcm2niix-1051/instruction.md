# Issue

**Title:** WASM: allow the heap to grow to 4GB

## Description

Is it possible to bump this to 4GB or is this bad practice allowing this to eat up RAM. Was just having trouble with large files.

Build both WASM targets with MAXIMUM_MEMORY=4GB, the wasm32 limit. Emscripten's default stops growth at 2GB, which cannot hold a long multiband fMRI run or a large CT series, and an allocation past it ends in an out-of-bounds write that crashes the browser tab instead of returning an error. INITIAL_MEMORY=32MB is needed because once a maximum is set, wasm-ld rejects the 16MB default as too small for the 16MB stack.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e1971d1a0fdf`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.