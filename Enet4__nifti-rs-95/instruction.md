# Issue

**Title:** Update dependencies (2022-05)

## Description

- Update dependencies (non-breaking)
   - pretty_assertions
- Update dependencies (breaking)
   - byteordered 0.6
   - nalgebra 0.31
   - simba 0.7.1

Cannot update approx until rust-ndarray/ndarray#1062 is resolved.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `273c4c7f65e3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.