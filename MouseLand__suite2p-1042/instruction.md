# Issue

**Title:** checking h5py key to open binaries before data_path

## Description

Hello, In the default_ops, it states that if a h5py contains elements to process that data_path will not be checked. To fix this, I re-ordered the logic in the io.utils.find_files_open_binaries so that the h5py is checked first and bypasses the data_path search. This PR is linked to an issue I opened just now. Thanks!

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d530bad52242`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.