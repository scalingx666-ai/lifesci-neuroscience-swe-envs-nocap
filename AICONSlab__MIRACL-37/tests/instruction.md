# Issue

**Title:** Updates to STA Workflow, Segmentation Tools

## Description

- added "dilation" feature that allows users to dilate regional mask when using STA workflow
- updated STA workflow to work from end to end
- updated orientation setting tool in registration workflow to display images in order
- fixed bug in segmentation GUI that set input to nested directory
- set default segmentation to cfos2
- set correct paths in cfos2 segmentation macro
- removed '_bin' from voxelization script
- fixed typos

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2088ffdd83be`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.