# Issue

**Title:** Fix cache spike vector in base sorting

## Description

When a sorting is loaded from a folder (NumpyFolderSorting), `cached_spike_vector` is read from `spikes.npy` which was saved with 4 fields (including `channel_index)`. The code then tried to assign this 4-field structured array into a 3-field selection and numpy refuses the cast. Fix: explicitly select only the 3 needed fields from the source array.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `38dff14c5ede`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.