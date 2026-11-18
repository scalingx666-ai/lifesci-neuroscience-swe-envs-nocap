# Issue

**Title:** Fix: do not include extra_metadata in zarr provenance dump

## Description

Similar to #4883, but for zarr provenance:

Since saving to zarr has its internal mechanism to store probe and timestampos info, we can safely drop these fields (extra metadata) from the provenance.

Also fixed a bug that prevented `include_extra_metadata` to be recursively passed to children when `to_dict(recursive=True)`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `98aeee60ca08`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.