# Issue

**Title:** Fix misplaced parenthesis in utils.py

## Description

fixes the following error when trying to use get_network_when:
```
line 986, in get_network_when
    network['j'].isin(ij))), (network['t'].isin(t)))]
TypeError: and_ expected 2 arguments, got 1
```
due to a misplaced parenthesis

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `40966c7698a0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.