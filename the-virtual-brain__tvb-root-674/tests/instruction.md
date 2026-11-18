# Issue

**Title:** TVB-3081 Make sure monitors are copied as different instances

## Description

deepcopy on a simulator was keeping the same instances of the Monitors on the clone.
we need new instances for the Monitors as well

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a526cca988f8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.