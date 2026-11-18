# Issue

**Title:** [FIX] ASR fixes

## Description

Most important changes here are:

- removing an unused and undocumented `name` parameter in the `__init__` function of the ASR class
- properly passing the documented `memory` key word argument to `__init__`
- As the two above changes are breaking, I made the init of the ASR class key word only, using the [asterisk notation](https://peps.python.org/pep-3102/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e44c4bb6ce17`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.