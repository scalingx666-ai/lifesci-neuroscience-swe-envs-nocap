# Issue

**Title:** MNT: PEP 639 compliance

## Description

## Changes proposed in this pull request

Declare licenses using only these two fields, as per PEP 639:
* `license`: SPDX license expression consisting of one or more license identifiers
* `license-files`: list of license file glob patterns

Supported by hatchling ≥ 1.27.0:
https://packaging.python.org/en/latest/guides/writing-pyproject-toml/#license-and-license-files

## Documentation that should be reviewed

N/A

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `adf472c708fe`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.