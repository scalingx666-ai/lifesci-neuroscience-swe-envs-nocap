# Issue

**Title:** Refactor compute_output_shape method in osl_dynamics/inference/layers.py class SeparateLogLikelihoodLayer(layers.Layer):

## Description

Closes: 

Update output shape computation to be (None, sequence length, n_states) rather than (None, sequence_length, n_channels).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `582c4b3a9fe6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.