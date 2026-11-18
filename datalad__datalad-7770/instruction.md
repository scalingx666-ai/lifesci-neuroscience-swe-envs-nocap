# Issue

**Title:** BF: Improve datalad operations on adjusted branches (crippled filesystems) through annex merge/adjust/etc

## Description

## Summary

This PR improves datalad's behavior on crippled filesystems (VFAT, NTFS) where git-annex uses adjusted branches. The changes enable several `update` operations that were previously broken and enable tests that now pass on adjusted branches.

### Bug Fixes

- **Enable `update --follow=parentds --how=merge` on adjusted branches**: Added `_annex_merge_target()` helper that uses `git annex merge` to merge specific commits on adjusted branches.

- **Enable `update --how-subds=reset` on adjusted branches**: Added `_annex_reset_target()` helper that extracts the adjustment mode from the branch name and uses `git annex adjust` to reset to a specific commit.

- **Sync parent after subdataset install on adjusted branches**: After installing a subdataset on a crippled filesystem, the parent's index needs to be synced.

### Test Improvements

- Enabled `test_update_how_subds_different` on adjusted branches with conditional handling.

- Removed `@skip_if_adjusted_branch` from 4 tests that now pass:
  - `test_merge_no_merge_target`
  - `test_nonuniform_adjusted_subdataset`
  - `test_AnnexRepo_always_commit`
  - `test_AnnexRepo_is_managed_branch`


attn @just-meng who is the current straggler with adjusted branches

## Issues Addressed

-  - Install on crippled FS now syncs parent after subdataset installation
-  - Status check accepts both corresponding branch and adjusted HEAD as clean
- Related to #5029 - Addresses root cause of Windows subdataset modified state
- Related to #5462 - Addresses subdataset state detection on crippled filesystems

## Test plan

- [x] All modified tests pass on regular filesystem
- [x] All modified tests pass on VFAT (crippled filesystem with adjusted branches)
- [x] Pre-commit checks pass

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b884cf2af405`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.