# Issue

**Title:** [ENH] Adds function to map CIVET to FreeSurfer

## Description

Also adds a fetcher for the CIVET surfaces and a CIVET surface reader function.

We should be able to use this to map the CIVET-space stat maps to `fsaverage6` space pretty easily @justinehansen @liuzhenqi77 ! I checked with the glycolytic index maps @justinehansen had provided me and this returns identical results to the Matlab script :grin:

To Do:
- [x] Add tests for dataset fetcher
- [x] Add tests for CIVET -> FS conversion (might require adding a test dataset?)
- [x] Update documentation with `netneurotools.civet` module functionality

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e8e3aaa0571c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.