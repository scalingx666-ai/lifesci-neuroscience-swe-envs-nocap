# Issue

**Title:** Option to return NaNs in compute_correlation

## Description

I've added a `return_nans` option to `brainiak.fcma.util.compute_correlation`. Original behavior was to return float 0.0 correlation for any vectors containing NaNs. Now, if `return_nans=False` (the default) we the original behavior, but if `return_nans=True` all zeros are replaced with NaNs before output. This is a very simplistic approach: Another way to do this would be to check the input matrices for NaNs and use this to supply NaNs in the output if `return_nans=True`. For example, if you somehow got a "true" correlation of zero, this would replace the zero with NaN even if there wasn't a NaN in the input. This PR references issue #400.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5f7628ced7e7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.