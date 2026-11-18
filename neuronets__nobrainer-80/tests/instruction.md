# Issue

**Title:** ADD: tensorflow probability and bayesian models

## Description

this pr adds:

- `StreamingStats` object to take mean, variance, and entropy of streaming 3d data. this will be used in bayesian model prediction code.
- bayesian dropout functions as `tf.keras.layers.Layer` classes based on https://arxiv.org/abs/1812.01719
  - tests for these functions, where the reference implementations are in [patrick-mcclure/nobrainer](https://github.com/patrick-mcclure/nobrainer/blob/92942a31794c4306b6cb406c8a89539d9b192e69/nobrainer/models/bayesian_dropout.py)

the model at https://github.com/neuronets/kwyk will be added to https://github.com/neuronets/nobrainer-models as a `tf.keras` model after this pr is fully tested and merged.

before merging, this pr requires:

- [x] tests of `StreamingStats`
- [ ] docstrings for the added functions and classes
- [ ] tests of the bayesian models

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `639e54f52174`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.