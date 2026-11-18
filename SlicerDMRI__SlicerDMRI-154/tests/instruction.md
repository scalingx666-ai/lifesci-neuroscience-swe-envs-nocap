# Issue

**Title:** ENH: refactor TractographyDownsample, add batch feature

## Description

* Remove a lot of replicated code passing lists of parameters
* Add batch downsample option to work from directories
  - keep directory tree structure in downsampled target
* Allow downsample logic to be used outside GUI

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b616b516e142`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.