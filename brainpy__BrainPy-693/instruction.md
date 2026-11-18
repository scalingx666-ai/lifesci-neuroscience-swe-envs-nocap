# Issue

**Title:** [doc] Correct the docstring of pre2post_event_sum

## Description

This pull request includes changes to the `pre2post_event_sum` function in the `brainpy/_src/math/pre_syn_post.py` file to correct the indexing of `post_val` and ensure proper summation of values.

Corrections to indexing and summation:

* [`brainpy/_src/math/pre_syn_post.py`](diffhunk://#diff-ee5eaf5f703c06aee06b6cc3590ca686ba81472d1be9a174b1be2c116e481cc8L59-R59): Corrected the indexing of `post_val` from `post_ids[i]` to `post_ids[j]` to ensure that the correct post-synaptic values are updated.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2a5adea09aeb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.