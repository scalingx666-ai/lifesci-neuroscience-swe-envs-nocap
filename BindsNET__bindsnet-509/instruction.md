# Issue

**Title:** Tensor support for wmin/wmax

## Description

Added ability to use tensors for wmin/wmax on synaptic connections. Primary changes were the assignment of wmin and wmax as torch.Parameter's in the abstract connection class so they can always be interpreted as tensors (either of single or multiple values), and wrapping checks for -/+ inf in the wmin/wmax with an any() function. This occurred in both the Learning.py and Topology.py files.

Note:
- Local connection and Sparse connection have seen decently large changes. Our testing module passed without any errors, and we don't believe core functionality has changed. Regardless, these are probably the most prone to new logical errors.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `91ffafb23eb4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.