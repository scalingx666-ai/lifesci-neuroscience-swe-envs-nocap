# Issue

**Title:** Added Efficientnet backbone from FFN

## Description

- Added Efficientnet, depthwise convs, non local blocks, strip pooling and partialconv.
- Instance norm and Group norm were switched in get_norm. Fixed.
- Made groups in group norm dependent on channels (otherwise it causes and error).
- Added tests for Efficientnet backbone. Tests for the non local and strip-pooling blocks are still needed.
- Fixed a typo in criterion.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6d6a45634b81`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.