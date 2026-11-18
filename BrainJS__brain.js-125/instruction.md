# Issue

**Title:** Add a small browser test and automated runner script

## Description

This is a follow-up for #124 and adds a small browser Mocha test and automated test runner script which can be run (using Firefox) via `npm run test-browser`. It could be added to CI to make sure that the basic browser build is working.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b057d4c24239`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.