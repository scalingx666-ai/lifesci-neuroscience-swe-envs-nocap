# Issue

**Title:** BUG: Fix OpenXR rendering not resuming automatically after headset doff/don

## Description

The git hash containing the previously implemented fix to address headset doff/don wasn't included in External_VTK.cmake.

$ git shortlog 6181bb1223bbc499a340a1644f5356e7e152c318..c9cd17a377cbc7e488329e882a35b70c7f37fe76 --no-merges Andras Lasso (1):
      BUG: Resume OpenXR rendering automatically after headset doff/don

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ea1d2e483edb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.