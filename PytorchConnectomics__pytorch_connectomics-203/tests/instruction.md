# Issue

**Title:** Add SoftClDiceLoss and register it in the loss stack

## Description

SoftClDiceLoss was introduced as a new segmentation loss that focuses on preserving structure using soft skeletonization, with support for binary and multi-class modes and efficient tensor operations. It was fully integrated into the system through the loss factory, metadata, and module exports, and validated with unit tests covering functionality and correct orchestration behavior.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6547dd56c690`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.