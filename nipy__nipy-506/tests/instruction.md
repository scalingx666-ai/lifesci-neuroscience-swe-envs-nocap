# Issue

**Title:** MNT: Update build tools to work with modern pip

## Description

Pip uses build isolation by default. This adds a `pyproject.toml` to declare the build-time dependencies. It also tweaks the `sys.path` in `setup.py` to ensure that `setup_helpers` can be imported in an isolated environment.

There's a lot more that needs removing to cope with the upcoming 3.12 removal of distutils, but this is a short-term plug that moves things in the right direction.

nipy/nitime#199 added `cibuildwheel`. I could do that in a separate PR if desired.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9512cd93b721`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.