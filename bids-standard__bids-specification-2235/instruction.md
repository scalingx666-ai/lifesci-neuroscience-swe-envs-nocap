# Issue

**Title:** fix: Use max of float-or-array fields for numerical metadata checks

## Description

.

Changes proposed:

- Instead of directly comparing fields that can either be floats or arrays to a single value, take the max of the field. This assumes that `max(float)` will return the float. The checks I modified are `PostLabelingDelayGreater`, `BolusCutOffDelayTimeGreater`, `LabelingDurationGreater`, and `EchoTimeGreaterThan`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2592b293cfa3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.