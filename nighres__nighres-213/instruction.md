# Issue

**Title:** Address #212 detecting JAVA_HOME on RHEL-like systems

## Description

RHEL separates the JDK and JRE, leading to a wrong value for `JAVA_HOME`. This fixes that. Addresses #212

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3d729d0c07f7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.