# Issue

**Title:** test: fast ci if regular branch, full suite if PR to main

## Description

As of now, push to any branch will cause full suite of test to run. This takes a long time, and potentially becomes the bottleneck when new builds are pushed often. 

This PR changes this behavior:

- push to regular branch will run the baseline unit/e2e tests (ubuntu-latest/py3.8)
- any PR to main will trigger trigger full suite of tests (ubuntu/windows + py3.7-3.12)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d3c9626e7335`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.