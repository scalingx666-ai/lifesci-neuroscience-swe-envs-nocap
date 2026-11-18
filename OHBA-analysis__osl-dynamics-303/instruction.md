# Issue

**Title:** Add temperature annealing callback for the Gumbel-softmax distribution

## Description

This pull request introduces a callback for annealing the temperature in a Gumbel-Softmax distribution (`GumbelSoftmaxAnnealingCallback`). The current implementation supports linear annealing, but we can expand it to include other annealing strategies in the future.

The changes are backwards compatible and tested with model training scripts. This enhancement aims to improve the flexibility of temperature scheduling in `SampleGumbelSoftmaxDistributionLayer`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ab6f31bc8947`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.