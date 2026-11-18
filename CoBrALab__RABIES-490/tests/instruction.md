# Issue

**Title:** Update to 0.6.0

## Description

<!-- This is an auto-generated comment: release notes by coderabbit.ai -->
## Summary by CodeRabbit

* **Chores**
  * Bumped project version to 0.6.0 and updated release date in metadata.

* **Documentation**
  * Updated documentation release identifier and docs dependency to match 0.6.0.

* **User-facing fixes**
  * Clarified CLI help for timeseries interval format (now uses "0-80" style).

* **Improvements**
  * Enhanced QC processing: increased memory allocation and explicit cleanup to improve QC report/video reliability and reduce runtime memory pressure.
<!-- end of auto-generated comment: release notes by coderabbit.ai -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8b260b6e8db1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.