# Issue

**Title:** PEP 639 compliance

## Description

Declare licenses using only these two fields, as per PEP 639:
* `license`: SPDX license expression consisting of one or more license identifiers
* `license-files`: list of license file glob patterns

Supported by hatchling ≥ 1.27.0:
https://packaging.python.org/en/latest/guides/writing-pyproject-toml/#license-and-license-files

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b5ecf482648a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.