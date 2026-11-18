# Issue

**Title:** STYLE: Prefer obtaining the module filenames automatically from Python

## Description

Prefer obtaining the module filenames automatically from Python: fixes messages where the filename is incorrect.

Left behind in commit becfe63.

Take advantage of the commit to use the Python 3 print function (using brackets) instead of the Python 2 statement where no further f-strings can be used.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `afcb30b319e0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.