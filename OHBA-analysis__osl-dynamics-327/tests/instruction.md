# Issue

**Title:** Use MAP estimate in Gumbel-Softmax sampling during inference

## Description

### Description:
This pull request updates the behaviour of the `call()` function in the `SampleGumbelSoftmaxDistributionLayer` class to handle training and inference phases differently.

During training, the layer samples from the Gumbel-Softmax distribution, maintaining stochasticity. However, during inference (prediction or testing), it uses the MAP estimate by applying a softmax to the logits with the specified temperature, without adding Gumbel noise.

This approach aligns the inference behaviour of `SampleGumbelSoftmaxDistributionLayer` with the established practices used in `SampleNormalDistributionLayer`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `80b91680203c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.