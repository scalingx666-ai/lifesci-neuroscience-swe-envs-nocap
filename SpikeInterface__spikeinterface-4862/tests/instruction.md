# Issue

**Title:** Fix: channel_slice should not check overlapping probes

## Description

Channel slice should simple reset a slice of the probe, without checking bounding boxes etc.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fd5d42312420`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.