# Issue

**Title:** Cast constant to desired output type.

## Description

`tf.constant` cannot change the data type if `self.value` is already a tensor.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `18082295198b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.