# Issue

**Title:** Fix boundingbox transformation

## Description

siibra had a serious bug when transforming bounding boxes: Both `.warp` and `.transform` would create the new bounding box by just transforming the min- and max point. But since the bounding box is axis aligned, this is not correct - other corner points could form the new min- or maxpoint in the new coordinate system after warping. Therefore, all corner points (8 in general) need to be transformed, and a new min- and maxpoint have to be determined in the target space to create the transformed bounding box.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `19b6e64f5f30`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.