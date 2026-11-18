# Issue

**Title:** Automated bad segment removal.

## Description

Usage:
```
from osl_dynamics.data import Data

data = Data(...)
data.remove_bad_segments()
```
The new method reproduces the bad segment detection in OSL:

https://github.com/OHBA-analysis/osl/blob/main/osl/preprocessing/osl_wrappers.py#L304

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e175f70ebe6a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.