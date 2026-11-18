# Issue

**Title:** chore: Run CI tests from locked pixi environments

## Description

Been bugging me for a while that using pixi has meant we lost the advantages tox-uv provides for testing pinned environments. This moves the minimum, py313, and py314 environments into pixi, pins them, and puts them on GHA. Pre-release builds work better unlocked, so we continue using tox-uv for those, but I move them into pyproject.toml, so all our test environments are still in one file.

The breakdown of commits was aiming to make each change to the lockfile comprehensible.

Also adds a pre-release build for Python 3.15. It's not yet resolvable in conda.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ec6f2661a0ed`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.