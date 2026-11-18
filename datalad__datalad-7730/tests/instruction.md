# Issue

**Title:** Remove absolute path specification from `/bin/ls` invocation while interrogating remote path

## Description

`/bin/ls` is not available on every unix system like on mine (NixOS).
This should fix the compatibility issue

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2e48124b04fe`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.