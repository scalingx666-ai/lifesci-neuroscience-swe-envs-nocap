# Issue

**Title:** fix: Re-add versioneer hooks

## Description

Versioneer does not magically inject setuptools hooks, so you need to use `get_cmdclass()` to ensure that the `_version.py` file is updated on installation.

I suspect we could simplify a lot of the versioning here by building the wheel within a Docker build layer, but it would be good to get an understanding of all the use cases you have for making the version available. We can then verify/add CI tests and comfortably start removing hacks.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `64adc8d0ac05`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.