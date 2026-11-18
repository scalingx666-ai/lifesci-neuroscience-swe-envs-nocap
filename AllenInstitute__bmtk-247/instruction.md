# Issue

**Title:** PR for resolving some inefficiencies

## Description

Changes in edge_adaptor.py caches the loaded dynamics files, and avoid reading them multiple times.
This is helpful if you run networks with many edge types.


Changes in spike_train_readers.py is to avoid looping over HDF5 array.
For the sorted case, I also implemented a vectorized way of setting the slices.
For the non-sorted case, just copied the HDF array into np array first.

This may cause an issue for a very large spike file that's larger than memory size. In that becomes the problem, I suggest reading chunk by chunk from the HDF5 file (~1GB or so) instead of looping over it.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d04770e8f2ca`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.