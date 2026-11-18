# Issue

**Title:** [FEAT] Add caching options for geometry

## Description

The following PR implements unified geometry fetchers for common brain spaces with a caching system. Geometric embeddings can be retrieved in their full-rank or low-rank form.

For surfaces:

- fsaverage3
- fsaverage4
- fsaverage5
- fsaverage6
- fsaverage7
- fsaverage

For volumes:
- mni152_gm_mask
- mni152_brain_mask

TODOs:

- [x] Docstrings
- [x] Unit tests

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b1063cd6c43c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.