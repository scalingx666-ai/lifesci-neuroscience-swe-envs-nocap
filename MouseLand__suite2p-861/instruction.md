# Issue

**Title:** Test Data Generation Script Changes

## Description

- Pin scipy package to above 1.9.0 to avoid `mode(..., keepdims=True)` error that occurs during detection phase
- Update Test Data generation script to remove `.bin` files made
- Test Data generation script also downloads `test_inputs` if not present locally
- Addresses deprecated parameter `pages` for `tifffile.imread` issue #831

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d8a4fb33dfd8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.