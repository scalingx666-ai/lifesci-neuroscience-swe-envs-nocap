# Issue

**Title:** Save configuration of custom layers.

## Description

TensorFlow 1.15 and 2.2.0 save the configuration of custom layers with arguments in `__init__` (e.g. with `tf.keras.Model.save` and `tf.keras.callbacks.ModelCheckpoint`) only if `get_config` is overridden accordingly. See output [before](https://github.com/adalca/neuron/files/4806813/before.txt) and [after](https://github.com/adalca/neuron/files/4806812/after.txt).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `63a3a4c7c13a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.