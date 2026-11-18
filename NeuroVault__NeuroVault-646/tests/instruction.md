# Issue

**Title:** Upgrade pip before installing dependencies

## Description

This removes repeated stderr message during container build:

    You are using pip version 8.1.2, however version 10.0.1 is available.
    You should consider upgrading via the 'pip install --upgrade pip' command.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0fde72f3eb33`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.