# Issue

**Title:** Move regression tests to eeglab_tests

## Description

Remove the tests folder and the CI step that ran it. The two regression test files now live in sccn/eeglab_tests under regression_tests, where that repository's local runner and CI discover them, so EEGLAB core keeps no centralized test suite. Counterpart:

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6a4861063702`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.