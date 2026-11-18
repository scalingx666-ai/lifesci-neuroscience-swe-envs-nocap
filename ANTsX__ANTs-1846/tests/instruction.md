# Issue

**Title:** CI: Move ubuntu 20.04 to Docker, revive Centos7

## Description

The Ubuntu 20.04 runner is being retired, so move that to the docker build. Also bring back centos 7 builds.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4f60d79997ff`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.