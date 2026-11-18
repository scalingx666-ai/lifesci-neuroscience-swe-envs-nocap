# Issue

**Title:** ENH: Write out goodvoxels mask

## Description

. I'm happy to move the DerivativesDataSink into `init_goodvoxels_bold_mask_wf` if the current approach clutters up the workflow too much.

## Changes proposed in this pull request

- Add a DerivativesDataSink to `init_bold_wf` to write out the goodvoxels mask.
- Update the expected outputs for relevant tests.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `566592a98fd2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.