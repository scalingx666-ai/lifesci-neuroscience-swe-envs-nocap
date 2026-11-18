# Issue

**Title:** Add websocket port to settings and default to 4547

## Description

* Changes default websocket listen port from `1234` to `4547`
* Adds configuration setting for changing it to `Settings -> Network` (and according `.cfg` file)(Restart required!)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a3080cb39761`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.