# Issue

**Title:** feat: sharded meshes (single res using trivial multi-res)

## Description

Adds several new features:

- `igneous view $DATASET` to open an on-disk dataset in neuroglancer
- `igneous mesh ... --sharded` generates fragments
- `igneous mesh merge-sharded ....`
- Changes sharded skeletons to automatically compute sharding config
- Create spatial index database from meshes `igneous mesh spatial-index create $PATH` `igneous mesh spatial-index db $PATH $DATABASE`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7a92932339e6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.