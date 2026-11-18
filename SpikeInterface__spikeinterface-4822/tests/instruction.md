# Issue

**Title:** Drop the separate core test workflow

## Description

`core-test.yml` runs the core tests on the three OSes with Python 3.10, but `all-tests.yml` already does the same as its first test step (same events, same `--group test-core` install, plus Python 3.13) and stops the job before the expensive modules if core fails. This PR removes `core-test.yml` so every push to a PR runs three fewer jobs, and runs the core step of `all-tests.yml` through `run_tests.sh` so we keep the verbose output and the timing summary.
This is the last item of #3100 that I think is worth doing, so this should close #3100.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7d7bd2140b32`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.