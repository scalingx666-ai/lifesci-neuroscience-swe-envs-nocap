# Issue

**Title:** Feature/fix fullinfo error code

## Description

There is an issue with getting a stream `fullinfo`.

Because EC is not initialized with `lsl_no_error` the value of `ec` can be undefined, resulting in checks of `ec` incorrectly reporting that there was an error `ec != 0`.

This just adds the same initialization that exists in other functions that use `ec`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cdf917d0936d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.