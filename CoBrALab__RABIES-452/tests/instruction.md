# Issue

**Title:** fix: created to published tag and manual triggering

## Description

<!-- This is an auto-generated comment: release notes by coderabbit.ai -->

## Summary by CodeRabbit

* **Chores**
  * Updated release workflow to trigger when releases are published to the public, rather than when initially created
  * Added support for manual workflow dispatch, allowing release builds to be triggered with custom tag names for testing or special releases
  * Enhanced version extraction and release upload process to handle both automatic and manual release workflows consistently and reliably

<!-- end of auto-generated comment: release notes by coderabbit.ai -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4b1ea8b234d7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.