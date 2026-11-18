# Issue

**Title:** Optional nativecommonspace outputs

## Description

<!-- This is an auto-generated comment: release notes by coderabbit.ai -->

## Summary by CodeRabbit

## Release Notes

* **New Features**
  * Added `--resampling_space` CLI option to control output generation: choose `common_only`, `native_only`, or `both` to optimize memory and processing time.

* **Bug Fixes**
  * Enhanced validation to ensure correct outputs are generated based on the selected analysis space.

* **Documentation**
  * Expanded preprocessing documentation with dedicated mask resampling section and updated workflow references.

<sub>✏️ Tip: You can customize this high-level summary in your review settings.</sub>

<!-- end of auto-generated comment: release notes by coderabbit.ai -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `369d3f2e18b8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.