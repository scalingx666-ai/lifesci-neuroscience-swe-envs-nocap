# Issue

**Title:** FIX: Problem to launch `cmpbidsappmanager` in Ubuntu 18.04

## Description

This PR updates `conda/environment.yml` and `conda/environment_macosx.yml` to address:
- #206 

**Note:** It introduces an upgrade from python `3.7` to `3.9` which involved the renaming of the previous `py37cmp-gui` to `py39cmp-gui` to be consistent. References to `py37cmp-gui` has been changed in the documentation and the README.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `698425a3b2ab`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.