# Issue

**Title:** Allow unit norm embeddings.

## Description

This allows the unit norm constraint on embedding vectors. 
This feature is still experimental and haven't been validated.
This feature can be achieved by setting `unit_norm_embeddings = True` when defining the `config` of HIVE or DIVE.
When multiple session labels are in the model, this ensures the embedding vectors are identifiable.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `eba9733a4600`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.