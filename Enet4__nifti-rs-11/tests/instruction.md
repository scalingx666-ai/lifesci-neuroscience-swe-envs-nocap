# Issue

**Title:** Improve documentation

## Description

- Mention `ndarray_volumes` feature in lib.rs
- Explain `LinearTransform` a bit more
- Expand `InMemNiftiVolume` docs on `ndarray` and array memory order
- Significantly expand documentation in `volume::ndarray` module
- rustfmt ndarray.rs

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `25b0f709702b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.