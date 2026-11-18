# Issue

**Title:** update SampEn and AppEn to allow for variable tolerance values

## Description

Extension of the SampEn and AppEn functions in order to be able to flexibly set the respective tolerance r. By default, the value is set relative to the standard deviation, but it is also possible to specify an absolute value.

PR refers to #31

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `14e718161f51`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.