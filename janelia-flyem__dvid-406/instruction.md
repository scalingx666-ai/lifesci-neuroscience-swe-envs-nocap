# Issue

**Title:** disallow labelmap /split endpoint by default

## Description

The labelmap `/split` endpoint is deactivated by default, so to enable it, you must add a `allowLabelmapSplit = true` to the config TOML file. @stuarteberg

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5130f6cf46b4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.