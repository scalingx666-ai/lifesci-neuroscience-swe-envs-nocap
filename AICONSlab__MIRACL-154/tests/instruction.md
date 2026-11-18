# Issue

**Title:** [fix] pin typer to 0.11.1 to fix MIRACL breaking changes introduced by ACE

## Description

Python's typer package is automatically being installed as part of PyTorch. However, the Typer version installed was > 0.12.0 which changed its dependency structure, removing the need for typer[all]. After version 0.12.0, the typer package uses typer-slim[standard] which includes the default dependencies, instead of typer[all]. This introduced breaking changes to MIRACL and the installed version of PyTorch. Pinning the version to 0.11.1 solved the issue. Also moved up torchio to more clearly cluster it with other PyTorch packages.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3ca844316bbf`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.