# Issue

**Title:** Vectorial learning rates for all UpdateRules.

## Description

:param nu: Single or pair of learning rates for pre- and post-synaptic events. It also accepts a pair of tensors to individualize learning rates of each neuron. In this case, their shape should be the same size as the connection weights.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5163fcc5175f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.