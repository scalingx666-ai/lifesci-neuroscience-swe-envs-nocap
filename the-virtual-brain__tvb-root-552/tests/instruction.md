# Issue

**Title:** TVB-3006 Fix tests. Integrate with Sonar coverage

## Description

Merge `full_tests.yml` into `build.yml`
Run all unit-tests with Coverage
Integrate coverage results in Sonar
TVB-2962 Fix `neotraits` incompatibility with newer `numpy` versions
Fix `test_launch_multiple_operations` random failure

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dcdc59d0f314`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.