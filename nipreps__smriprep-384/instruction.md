# Issue

**Title:** FIX: Update surfaces with fsnative2t1w_xfm

## Description

We weren't applying the fsnative2t1w_xfm to the surfaces when converting. Also updated the transform to nitransforms directly, and invert the fsnative2t1w mapping, since that mapping maps points in T1w space to fsnative and we need to go the other way.

Confirmed that surfaces now align. This is needed to get CIFTI resampling working correctly, as that depends on GIFTIs.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `05ae8c5b7c15`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.