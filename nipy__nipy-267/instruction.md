# Issue

**Title:** NF: add script to build dmg files from buildbots

## Description

The buildbots build mpkgs; this script builds dmgs from the mpkgs and
sets the permissions correctly.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3e7291fa07bc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.