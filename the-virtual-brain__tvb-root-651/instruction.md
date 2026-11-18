# Issue

**Title:** HBP-216 Add elasticsearch parameters in docker config file

## Description

Document better HBP-216 by putting the `ELASTIC_*` keys in `.tvb.configuration` file distributed inside docker containers

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4cac6cc3c387`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.