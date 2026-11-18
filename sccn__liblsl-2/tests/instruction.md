# Issue

**Title:** Only allow explicit template instantiations in one object file

## Description

This ~should fix~ fixes the `multiple definition of `typeinfo name for boost::archive::...` errors on ARM

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ecd2a3632122`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.