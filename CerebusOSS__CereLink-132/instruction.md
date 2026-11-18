# Issue

**Title:** Build more wheels for more Pythons

## Description

* Build more wheels for Pythons 3.9-3.11
* migrate to pyproject.toml
    * This was intended to help with cibuildwheel but that turned out to be unrealistic. Still, keeping the pyproject.toml file.
* Remove some complexity for Qt version searching even though Qt5 is no longer supported.
* Fix a bug

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c29496296158`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.