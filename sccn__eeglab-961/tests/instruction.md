# Issue

**Title:** Guard pop_chanedit when DIPFIT is not installed

## Description

The channel location dialog and the lookup aliases for DIPFIT templates called dipfitdefs unconditionally. The dialog now lists the DIPFIT templates only when the plugin is available, and the aliases raise an explicit error asking to install DIPFIT or pass a file path. Verified with and without DIPFIT on the path.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2922a4cb05d3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.