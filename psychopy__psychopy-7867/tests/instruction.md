# Issue

**Title:** docs: match gltools getIntegerv/getFloatv/getString docstrings to parName

## Description

`getIntegerv`, `getFloatv` and `getString` in `psychopy/tools/gltools.py` take an argument named `parName`, but their docstrings document it as `pName`. Both copies of each function in the module have the same docstring, so this changes all six.

The `getFloatv` docstring also gave the type as `float`. The argument is the OpenGL enum passed to `glGetFloatv` ("OpenGL property enum to query"), so it is now `int` like in the other two.

I found these by comparing the documented parameter names with the function signatures. After the change, the comparison reports no mismatch for these functions. Docstrings only, no behaviour change.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `444dc5c49025`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.