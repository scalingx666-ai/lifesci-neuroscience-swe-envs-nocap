# Issue

**Title:** Review python dependencies

## Description

<!-- This is an auto-generated comment: release notes by coderabbit.ai -->
## Summary by CodeRabbit

* **Chores**
  * Removed an external imaging dependency and bundled needed image/colormap utilities locally.
  * Updated packaging to restrict supported Python versions (<3.13).
  * Cleaned up unused imports and removed redundant local imports in visualization/preprocessing modules.

* **New Features**
  * Added a built-in colormap implementation for consistent plotting.

* **Bug Fixes**
  * Replaced deprecated pandas append usage with a modern concat-based approach.
<!-- end of auto-generated comment: release notes by coderabbit.ai -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f6d4ddda7bfe`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.