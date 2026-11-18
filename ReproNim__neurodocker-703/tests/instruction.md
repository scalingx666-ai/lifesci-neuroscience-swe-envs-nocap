# Issue

**Title:** Get rid of setup.cfg

## Description

The sdist doesn't change when uncommenting the comments in this file. It seems useless as it is.

I understand [options.package_data](https://setuptools.pypa.io/en/latest/userguide/datafiles.html#package-data) in `setup.cfg` is specific to setuptools. , which changed the build system to hatchling and removed or commented everything in `setup.cfg`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `188a7298b37f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.