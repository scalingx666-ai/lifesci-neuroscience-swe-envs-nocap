# Issue

**Title:** Server memory cap 3 GB

## Description

Config only.
- The Railway config's server memory cap matches the live 3 GB setting, so a later config apply does not lower it again.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bdd67c974bf9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.