# Issue

**Title:** Move version restore view files into own folder

## Description

### Summary
- Moves the `version_*` view files into `viewer/view/version_restore_view/` and updates imports..
- Also: bisect only shows the final result once navigating to the first bad version succeeded (review feedback from #10214).

### Steps to test:
- `yarn ts` passes; version restore view still opens.

### Issues:
- none

------
- [x] Removed dev-only changes like prints and application.conf edits

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1e8a32fbd064`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.