# Issue

**Title:** Fix codemeta generation crash on mononyms and middle names

## Description

This PR simplifies the [CONTRIBUTORS](https://github.com/brian-team/brian2/blob/master/CONTRIBUTORS) parsing logic in [create_codemeta.py](https://github.com/brian-team/brian2/blob/master/.codemeta/create_codemeta.py)  by replacing the rigid regex with standard string splitting. This resolves a ValueError crash caused by single-word names (mononyms) and fixes the additionalName FIXME by naturally incorporating middle names into the givenName field, ensuring the generated JSON passes validation.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `983696c3cfd3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.