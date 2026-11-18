# Issue

**Title:** Fix Python 3.11 import

## Description

Starting in Python 3.10, `collections.Iterable` no longer exists.  It is available as `collections.abc.Iterable`.  This was causing `import torchsample` to fail in my new Python 3.11 environment. After this update, torchsample imports successfully under Python 3.11. `collections.abc` was created starting in Python 3.3, so I expect this to work with Python>=3.3.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1f328d1ea3ef`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.