# Issue

**Title:** Use neurodebian for Dockerfile

## Description

For me the DockerFile stopped working because of an older version of the SSL libraries in Ubuntu 14.04. I updated the DockerFile a little bit to use a newer version of Ubuntu. Specifically, Neurodebian, which is also used by many other neuroDockers.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b4304a1ee7d8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.