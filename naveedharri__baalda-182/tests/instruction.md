# Issue

**Title:** Simplify Pro upgrade copy and highlight Jev

## Description

Removes note-limit numbers from the shared upgrade copy and replaces the AI benefit with “Jev from TypeSafe is available on Baalda.” Updates the current release notes to match. Sync-limit enforcement is unchanged.

Validation: all 29 desktop billing tests passed; git diff --check passed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `33b7388f39fc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.