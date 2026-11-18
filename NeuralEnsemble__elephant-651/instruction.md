# Issue

**Title:** [MAIN] update gh-action runner from macOS12 to macOS14

## Description

The macOS-12 environment is deprecated, consider switching to macOS-13, macOS-14 (macos-latest) or macOS-15. For more details, see 

### Changes Made
- Updated macOS runners to now use macOS-13 and 14 (dropped macOS-12)
- Updated the `upload-artifact` action to version 4. The migration guide was followed to ensure compatibility and proper usage. See: [here](https://github.com/actions/upload-artifact/blob/main/docs/MIGRATION.md).
- Updated the `cache` action to version 4.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `123ca040b11a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.