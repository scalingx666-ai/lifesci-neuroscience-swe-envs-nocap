# Issue

**Title:** TEST: Allow VALIDATOR_ARGS to affect run_tests.sh behavior

## Description

This will make it easier to test new features on the validator.

Also worked out the logic of this file and attempted to rewrite it to be clearer. Opening PR to make sure I didn't break things...

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7b439602298a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.