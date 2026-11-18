# Issue

**Title:** COMP: Add Meta AR video passthrough

## Description

Update VTK's OpenXR interface to work with OpenXR SDK release-1.1.58.

Slicer/VTK:
$ git shortlog ddd10cf957df01f54eca6546e975e502ea248645..6181bb1223bbc499a340a1644f5356e7e152c318 --no-merges Kyle Sunderland (3):
      ENH: Streamline frame state management into a single pathway
      ENH: Add Meta passthrough and environment depth occlusion support
      ENH: Add miscellaneous fixes for OpenXR update and passthrough

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f1fb90d7552e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.