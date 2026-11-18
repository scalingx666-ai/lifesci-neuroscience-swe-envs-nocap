# Issue

**Title:** BF: fix shebang lines for scripts

## Description

Shebang lines should be "!python" in order for setuptools / pip to
rewrite the shebangs when installing.

Fixes errors on Python 3.5 e.g.
http://nipy.bic.berkeley.edu/builders/nipy-bdist32-35/builds/6/steps/shell_10/logs/stdio

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fc95f66b3994`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.