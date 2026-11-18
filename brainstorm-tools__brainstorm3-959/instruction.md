# Issue

**Title:** [IO] Fix snirf reading artinis

## Description

Fix nirs optode naming when using Artinis with multiple devices. Multiple source/detector would otherwise have the same name.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9058496ba93b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.