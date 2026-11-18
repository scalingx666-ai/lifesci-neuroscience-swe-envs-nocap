# Issue

**Title:** Sim cleanup

## Description

# Overview

Code cleanup, including linting, some light restructuring, and making the unit tests pass.

## Test

- Ran all unit tests
- Ran the simulator with sample data to ensure that it was still working correctly.

## Contributions

- Refactored DataEngine to take a RawDataProcessor as a parameter
- Fixed unit tests for DataEngine
- Removed hard-coded paths
- Fixed linting errors
- Fixed typing issues

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d16e207e4b56`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.