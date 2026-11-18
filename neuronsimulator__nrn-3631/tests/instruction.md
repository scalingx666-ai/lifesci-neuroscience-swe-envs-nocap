# Issue

**Title:** Add codegen for implicit `diam` and `area`

## Description

In case `diam` or `area` are not in the PARAMETER or ASSIGNED blocks, the codegen should still succeed to match NOCMODL's behavior.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a15e4fe5e84e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.