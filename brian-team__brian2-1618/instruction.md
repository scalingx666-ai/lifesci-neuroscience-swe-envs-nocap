# Issue

**Title:** Improve C99 check on Unix

## Description

The current C99 check hardcoded `cc` as the compiler name, which is usually available on Unix systems. In conda environments, however, compilers installed into the environment are not available under this name. Their names are made available via environment variables, though, so the updated code uses the `$CC` value first, and only uses `cc` as a fallback in case that variable is not defined. This should better match the behaviour when we actually compile things for running the simulation.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `40672b91d4a1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.