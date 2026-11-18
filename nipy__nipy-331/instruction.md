# Issue

**Title:** Cosine bf

## Description

It looks like the cosine_drift was not giving exactly the answer that spm does, while this implementation does. I also found that the basis (excluding the non - normalized constant term) was not exactly othonormal, this one is. I added a test using the output of spm_dctmtx and corrected the corresponding tests.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bb31c2170a8c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.