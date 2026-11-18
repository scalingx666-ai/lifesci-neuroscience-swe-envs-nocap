# Issue

**Title:** Vagrant dev container based on ubuntu 18.04

## Description

Most of the discussion is in #1970.

This is feature-complete as a MVP. Possible extensions include adding support for the channel layer over websockets, and serving the sphinx docs.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3558e743e350`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.