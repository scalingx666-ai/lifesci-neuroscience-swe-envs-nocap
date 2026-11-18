# Issue

**Title:** Feat: Add DyNeStE model for dynamic network modelling

## Description

This pull request introduces a new model called **Dynamic Network States (DyNeStE)**, which is a generative model that enables us to represent network dynamics in a categorical latent space.

**Key Changes:**

* Adds the `DyNeStE` model as a new module `osl_dynamics/models/dyneste.py`.
* Updates `osl_dynamics/layers.py`
  - `tf.Variable` is now replaced with `tf.keras.Variable`. This ensures model parameters are correctly tracked and restored when saving/loading weights.

**Testing:**

* The model has been tested on simulation and real datasets and is compatible with TensorFlow v2.19.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cff19fa07661`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.