# Issue

**Title:** Fixes travis

## Description

Travis changed `xenial` to use `xvfb` as a service: https://benlimmer.com/2019/01/14/travis-ci-xvfb/.  This check fixes that.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c9fe959a2854`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.