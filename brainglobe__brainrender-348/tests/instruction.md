# Issue

**Title:** Remove the markers to disable specific slowly running tests

## Description

All tests will either run "normally", or have been disabled if the functionality is broken ().

Developed on top of #346 so that should be merged first. Tests will fail until the new version of `brainglobe-utils` is released. 



Docs updated here:

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `004e84d66ac6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.