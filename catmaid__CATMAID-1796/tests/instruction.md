# Issue

**Title:** Tracing overlay: use default radius edit mode without dialog

## Description

Single-line change, but submitted as a PR because it is a silent change in behavior.

When the radius edit dialog is hidden with CTRL, still use the previously selected default radius edit mode. This is important when quickly adding radius annotations to already existing skeletons.

My only concern would perhaps be showing a warning or message when the default is not single-node (maybe also with the number of nodes changed), but because the current warning display is quite intrusive when this is being done repeatedly, I did not include one here.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `08f662618367`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.