# Issue

**Title:** Run the tests with `forkserver` on Linux

## Description

In #4422 we agreed that at minimum we should run the tests with `forkserver` (the default since Python 3.14) so we catch issues like #4469 before release. This PR makes `forkserver` the default for the tests on Linux, locally and on the CI, while users keep `fork`.

Note that we make our own tests run on `forkserver` locally. This is important for us to catch errors. Your normal execution code locally will keep running with `fork` though and you can still run the tests with `fork` using `pytest --mp-context=fork`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7d7bd2140b32`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.