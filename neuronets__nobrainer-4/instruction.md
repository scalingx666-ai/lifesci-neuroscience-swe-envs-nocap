# Issue

**Title:** Add/train keras highres3dnet

## Description

Add initial implementation of [HighRes3DNet](https://doi.org/10.1007/978-3-319-59050-9_28).

The network cannot be trained on whole volumes due to memory constraints. A mechanism is included to train on 3-dimensional, non-overlapping blocks of data. The size of the blocks should be tuned to the training goal.

At the moment, the network requires batch sizes that are multiples of the block size. In the near future, update this so that arbitrary batch sizes can be used. Batches can cross volumes. For example, all of the data from one volume might be used, and a subset of blocks from another volume will be included to complete the batch.

If the model is trained on blocks of data, the model will output predicts per block. Not included in this PR is a way to combine the predictions into a complete volume.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b5790e68d713`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.