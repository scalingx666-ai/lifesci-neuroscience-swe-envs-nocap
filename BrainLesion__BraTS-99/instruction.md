# Issue

**Title:** 98 feature decide on how to best handle logging defaults

## Description

- remove default logging sink in __init__.py. not necessarily ideal but seems fine for or use case. if issues arise we can shift
- add convenience logging methods to enable/disable/ add console handler
 - integration with standard logging lib does not seem urgent right now, might revisit if needed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `144845e46360`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.