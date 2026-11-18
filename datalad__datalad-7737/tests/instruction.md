# Issue

**Title:** fix: submodule property `datalad-url` used wrong submodule name

## Description

Instead of the relative path in POSIX conventions, it used the relative path in platform conventions. On windows this led to a dangling submodule property, detached from the actual submodule record, whenever a submodule was added in a 2nd-level subdirectory. This led to warnings from routines that parsed the submodule.

This change force-converts the name/path to POSIX conventions.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7d47b8b0fd9d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.