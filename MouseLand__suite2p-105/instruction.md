# Issue

**Title:** Loading plugins

## Description

It is done through the entry point mechanism.
All the plugins have a line in the Plugins menu. Each entry point
consists of a class with the objects .name, .menu, .window()

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d426f36069bd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.