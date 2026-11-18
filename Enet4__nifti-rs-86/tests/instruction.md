# Issue

**Title:** nalgebra 0.27.x & simba 0.5

## Description

Because of [this security advisory](https://rustsec.org/advisories/RUSTSEC-2021-0070), we thought that it's important to update asap nalgebra and simba to avoid any problems with a real bug or with a medical audit.

I didn't update `approx` to v0.5 because ndarray is still using v0.4.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `99408e7b1c71`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.