# Issue

**Title:** 3D viewer: use project coordinate space

## Description

Submitting as a PR for review by @tomka since he's the 3D viewer expert and may spot problems I haven't anticipated.

Note that this doesn't fix bounding box and missing sections updating on stack viewer focus change, the last two remaining tasks of #1048. I'll fix those after this is merged. However, it does fix bounding box and missing section generation for ortho stacks.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `81635c595508`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.