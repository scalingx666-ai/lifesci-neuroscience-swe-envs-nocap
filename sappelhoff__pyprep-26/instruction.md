# Issue

**Title:** add random_state param to funcs using rng

## Description

This should prevent the tests from "sometimes passing and sometimes not" like we observed in the past few runs.

With a random_state set in the tests, the results will be deterministic (and hence: pass)

This PR also contains many docstring fixes, so readability of the diff has suffered a little

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `18e0bf4198ca`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.