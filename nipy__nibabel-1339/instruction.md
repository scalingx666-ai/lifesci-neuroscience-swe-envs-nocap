# Issue

**Title:** CI: Add 3.13-nogil build

## Description

.

This initial job installs and tests:

* [x] numpy (nightly wheel)
* [x] scipy (nightly wheel)
* [x] pillow (sdist; no cp313t wheel issue/PR to link)
* [x] matplotlib (sdist, pending )
* [x] pyzstd (sdist)
* [x] pydicom (git)

We do not currently test:

* [ ] h5py (pending )
* [ ] indexed_gzip

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `08f5c44621d6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.