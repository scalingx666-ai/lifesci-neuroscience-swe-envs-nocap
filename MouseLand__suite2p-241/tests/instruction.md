# Issue

**Title:** HDF5 files are now recognized as .h5 format files.

## Description

HDF5 files were not recognized as valid a .h5 file format. This fix searches for .hdf5 files created using the h5py library.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6930c371ccee`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.