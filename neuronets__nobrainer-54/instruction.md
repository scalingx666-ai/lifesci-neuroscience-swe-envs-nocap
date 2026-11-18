# Issue

**Title:** ENH: prediction code + tests

## Description

- Add prediction methods
  - resize volumes if necessary (with skimage)
- Add rotate-and-predict option for predict cli
- Use tensorflow v2 behavior
- Always build master branch on travis
- Add tests for prediction code
- Add tests for cli
- Add tests for dataset preprocessing
- Misc. updates

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d4997abe50c2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.