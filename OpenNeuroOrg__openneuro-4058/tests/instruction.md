# Issue

**Title:** fix(worker): Avoid full index checkout on deletes

## Description

This prevents an expensive checkout during a file delete mutation that would often lead to timeouts of the operation and failed deletes.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ead8d9394570`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.