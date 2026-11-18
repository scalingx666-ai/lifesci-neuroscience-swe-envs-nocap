# Issue

**Title:** Add explanation for the assumption of what counts as signal in BRSA, correct default optimizer of BRSA

## Description

add notes in the documentation for the different assumption in BRSA from traditional RSA on what counts as signal. Also corrected the mismatch between documentation and actual implementation of the default optimizer. L-BFGS-B appears to require less memory and fits faster in each iteration than BFGS. But it is possible that more iterations are needed because Hessian is approximated, so the default max number of iteration is increased[](url)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7004561724cc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.