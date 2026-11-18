# Issue

**Title:** TFRecords improvement

## Description

Closes 

Several improvements related to the use of TFRecords.

- added `overwrite` argument to indicate whether to overwrite the tfrecord files when tfrecord config is not the same. This solves issue #181 .
- added method to save tfrecord files and function to load tfrecord files as a TF Dataset object, which could be passed to `model.fit` or `model.predict` direclty. This solves issue #230 .
- This PR also fixes some minor bugs.

To save a TFRecord dataset:
```
from osl_dynamics.data import Data

data = Data(...)
data.save_tfrecord_dataset("path_to_directory")
```
Note if `overwrite=False` and a previous `tfrecord_config.pkl` exists, the files won't be rewritten.

To load a TFRecord dataset:
```
from osl_dynamics.data import load_tfrecord_dataset

dataset = load_tfrecord_dataset("path_to_directory", batch_size=batch_size)

# Then it can be passed directly to train a model
model.fit(dataset)
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6dd23583838e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.