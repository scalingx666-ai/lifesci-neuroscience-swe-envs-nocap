# Issue

**Title:** [Multilingual] Delete non exhaustive list of translated instrument names

## Description

## Brief summary of changes

This PR removes the use of the test_names translation domain for instrument full names. The current translation list is incomplete and covers only a subset of the instrument names available in LORIS, resulting in inconsistent multilingual behavior. Until a better solution is implemented, displaying instrument full names in English provides a more consistent user experience than partially translated values.

#### Link(s) to related issue(s)

*  (Reference the issue this fixes, if any.)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4e076bc38ec5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.