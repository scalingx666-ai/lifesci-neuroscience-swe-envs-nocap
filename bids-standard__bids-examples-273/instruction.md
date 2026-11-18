# Issue

**Title:** ieeg: deprecate DCOffsetCorrection field

## Description

cc @ftadel @dorahermes based on 

I am removing the (in any case unused) DCOffsetCorrection field from some ieeg datasets. You may want to mirror these changes, if needed.

Also, please review and approve  ... or stop the process if you think it's going in the wrong direction.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ed942d96bc89`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.