# Issue

**Title:** ci: add allowed-to-fail free-threaded Python 3.14t test job; h5py>=3.16 on 3.14+

## Description

### ci: add allowed-to-fail free-threaded Python 3.14t test job; h5py>=3.16 on 3.14+

.

- Test workflow: ubuntu-latest / 3.14t matrix entry (experimental,
  continue-on-error), installing only the [tests] extra; a step asserts the
  interpreter is free-threaded and that importing moabb, its subpackages and
  h5py leaves the GIL disabled. Codecov upload skipped for experimental runs.
- pyproject: h5py>=3.16.0 for python_version >= 3.14 (first release with
  cp314t wheels); keep h5py>=3.10.0 below 3.14.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `360fd0583506`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.