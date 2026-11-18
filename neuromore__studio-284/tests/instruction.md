# Issue

**Title:** Fix Win CI | MSI Package

## Description

* Fixes `make dist` issues on Windows Github CI
* Creates MSI instead of ZIP in `make dist` on Windows (using `wix`)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `10a37cf4c03d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.