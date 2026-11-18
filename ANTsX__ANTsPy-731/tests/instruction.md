# Issue

**Title:** Build template: delete temporary files

## Description

- delete temporary files unless `output_dir=None`
- if output_dir is specified, save intermediate transforms so user can e.g. warp labels or other modalities to the atlas space

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `637912bcebac`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.