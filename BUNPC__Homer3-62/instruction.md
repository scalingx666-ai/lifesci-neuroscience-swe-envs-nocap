# Issue

**Title:** Bugfix/tdnirs corrections

## Description

Minor modifications to be able to read TD-Nirs data types:

- dataTypeIndex is now loaded from the HDF5 dataset.
- According to the snirf documentation [repo](https://github.com/fNIRS/snirf/blob/master/snirf_specification.md#nirsiprobemomentorders), probeClass property was renamed to momentOrders as opposed to momentOrder.
- Better handling of the case where wavelengthIndex property of the measurementList is empty.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5a544615c9ad`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.