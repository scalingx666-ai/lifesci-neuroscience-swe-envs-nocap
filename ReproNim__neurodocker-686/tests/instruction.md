# Issue

**Title:** Add 'arch' optional arg to miniconda template

## Description

Added 'arch' optional arg to miniconda template to enable the specification of non x86 binaries.

Without this option it isn't possible to build docker images with miniconda on ARM systems.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e7f35fc18b01`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.