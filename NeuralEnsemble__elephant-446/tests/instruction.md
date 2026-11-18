# Issue

**Title:** Fixes neo_tools unit tests to work with Neo 0.10.0+

## Description

In Neo 0.10.0, several helper functions from the test suite, such as  `fake_neo()`, have been removed and replaced by a cleaner and more light-weight implementation. Elephant tests had been using this functionality in the `neo_tools` module. This PR changes all tests to use the new implementations from Neo 0.10., and bumps minimum Neo requirements accordingly. Several deprecated objects, such as `Unit` and `ChannelGroup` have also been removed from the tests.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `784fb8d2acbf`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.