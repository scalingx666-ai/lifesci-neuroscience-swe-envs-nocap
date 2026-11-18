# Issue

**Title:** [FIX] update merge_imgs input type of dcm2niix Node

## Description

from Boolean to Enum to allow value 2 (2=auto, default in new versions). No usedefault to preserve backwards compatibility.
Issue #3533

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cdfe679a49f8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.