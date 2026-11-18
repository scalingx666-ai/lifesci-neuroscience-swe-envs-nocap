# Issue

**Title:** fUS and detrending

## Description

<!-- This is an auto-generated comment: release notes by coderabbit.ai -->
## Summary by CodeRabbit

* **New Features**
  * Enhanced detrending configuration: replaced `--detrending_order` with flexible `--detrending` parameter supporting custom polynomial orders and time intervals.
  * Users can now specify detrending scope (e.g., `order=2,time_interval=3-10`) for more granular control over confound correction.

<sub>✏️ Tip: You can customize this high-level summary in your review settings.</sub>
<!-- end of auto-generated comment: release notes by coderabbit.ai -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cedf833ee736`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.