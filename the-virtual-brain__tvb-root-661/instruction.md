# Issue

**Title:** TVB-3078 Create a redirect in the Pypi package "tvb" towards "tvb-library"

## Description

I already pushed this redirect into Pypi https://pypi.org/project/tvb/#history so you can test it from there directly.

This also adds Jan Fousek as author in `tvb-library`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ae17c8eb8e23`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.