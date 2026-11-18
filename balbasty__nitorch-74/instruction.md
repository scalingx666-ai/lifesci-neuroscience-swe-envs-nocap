# Issue

**Title:** Set nibabel version

## Description

It seems as `nitorch.io` errors when using the latest version of nibabel as its backend:
```py
AttributeError: type object 'ArrayProxy' has no attribute 'order'
```
Setting the nibabel version that nitorch uses to an older one seems to fix the problem.

@balbasty, have I changed the nibabel version in all places needed?

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fb1c419238aa`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.