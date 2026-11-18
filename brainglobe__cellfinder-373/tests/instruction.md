# Issue

**Title:** Migrate to Keras 3.0 with TF backend

## Description

A PR to migrate cellfinder to Keras 3.0 with tensorflow backend.

Two main changes from Keras 3.0:
- multiprocessing parameters are now specified in the generator (before, they were passed to the relevant model method, e.g. `model.fit()`)
- when saving models, the filepath name [needs to end with](https://keras.io/api/callbacks/model_checkpoint/#modelcheckpoint-class):
   - ".weights.h5" when saving only the weights of the model, or
   - ".keras" when saving the whole model (default).

In `trian_yml.py` for the `training_generator` and the `validation_generator`, I explicitly set `use_multiprocessing=False` even though it is the default, since this was done explicitly before too (see [here](https://www.tensorflow.org/api_docs/python/tf/keras/Model#fit)).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `99cbda0a83b5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.