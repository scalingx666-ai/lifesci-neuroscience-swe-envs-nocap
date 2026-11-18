# Issue

**Title:** OpenEphys I/O fixes

## Description

- updated get_binary_file_path to properly look in oe folder structure
- fixed indexing of processor streams to find AP and LFP even when NIDAQ processor is included

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `21852f58d1b3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.