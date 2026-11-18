# Issue

**Title:** A new set of pre-built seeds are made available for --seed_list

## Description

<!-- This is an auto-generated comment: release notes by coderabbit.ai -->
## Summary by CodeRabbit

* **New Features**
  * Seed handling now accepts both predefined seed names and external NIfTI mask files.

* **Documentation**
  * Help text expanded to explain seed-based connectivity workflow, seed choices, and template compatibility.

* **Improvements**
  * Resource installation switched to archive-based downloads with extraction and cleanup.
  * Seed selection flow refined to resolve and validate seed files and check template overlap.

* **Bug Fixes**
  * Updated default seed references used in example/error-checking scripts.
<!-- end of auto-generated comment: release notes by coderabbit.ai -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `20190c32479b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.