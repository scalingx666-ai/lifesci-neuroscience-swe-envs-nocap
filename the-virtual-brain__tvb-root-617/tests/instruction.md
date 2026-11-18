# Issue

**Title:** TVB-3017 AllenSDK incompatibility

## Description

In TVB-Distributions we had allensdk 0.16.3 and request-toolbelt 0.9
This combination is incompatible with Python 3.10

We found that `allensdk 0.16.3 and request-toolbelt 0.10.1` works, but we are also interested why allensdk is pinned so old

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0c79c3853cce`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.