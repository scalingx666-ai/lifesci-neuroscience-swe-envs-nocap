# Issue

**Title:** FIR with duration

## Description

Allows to specify duration for each FIR event.

Warning: predict  + LMM is not really supported right now and we don't throw a warning. I documented it in FIRbasis and firkernel, but it is not easy to throw a warning.

Not sure how to proceed. It is not easy to fix, because the basis function will have variable duration, depending on the duration provided in the kernel. We could  "cut" the kernel...

> Why does HRF not have this issue?

Good question! Because we specify the max length for the HRF :)

This is how it looks like
![grafik](https://user-images.githubusercontent.com/10183650/179986045-288604fd-9447-4924-9a8d-713b432ec82c.png)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `396dd2c76974`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.