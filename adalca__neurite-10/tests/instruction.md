# Issue

**Title:** Specify value to use for points outside the volume.

## Description

Add option `fill_value` to `neuron.utils.interpn`, `neuron.utils.transform` and `neuron.layers.SpatialTransformer`, for specifying an extrapolation value to use for points outside the valid domain.

Currently, nearest-neighbor extrapolation is being performed, which is not always desirable. The default `fill_value=None` reproduces current behavior.

Example using the default `fill_value=None` (current behavior):
<img width="771" alt="1_fill_value_none" src="https://user-images.githubusercontent.com/29034767/84710577-7f77ba80-af32-11ea-8b57-76fd2179bc7d.png">

Example using `fill_value=0`:
<img width="762" alt="2_fill_value_0" src="https://user-images.githubusercontent.com/29034767/84710584-81da1480-af32-11ea-8d15-05d073e90ccf.png">

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3b3bca8373ca`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.