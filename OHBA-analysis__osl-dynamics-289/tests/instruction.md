# Issue

**Title:** Separating original and simplified State-DyNeMo

## Description

State-DyNeMo can be implemented with either the original DyNeMo architecture or the simplified one. This pull request introduces a distinction between two implementations of State-DyNeMo:

1. The previous "State-DyNeMo" is renamed as "Simplified State-DyNeMo", and
2. The full version of State-DyNeMo is reintroduced, based on the original DyNeMo architecture.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ad9e97751fcf`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.