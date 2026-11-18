# Issue

**Title:** Enhance: improve Gubmel-Softmax temperature annealing callback

## Description

This PR improves the `GumbelSoftmaxAnnealingCallback` function in two aspects:

* It now supports an exponential annealing, which has been more commonly used in previous literature than the current linear decay.
* The `gumbel_softmax_layer` is now called only once, instead of being called at every epoch beginnings and endings, to enhance code efficiency and reduce bottlenecks.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a5913c1ff5bf`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.