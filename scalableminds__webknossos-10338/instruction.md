# Issue

**Title:** Replace deprecated word-break: break-word

## Description

### Summary

Replace the deprecated `word-break: break-word` with its equivalent `overflow-wrap: anywhere` (5 places). The `.ant-table-column-title` reset becomes `overflow-wrap: normal` so that column titles in `.large-table` still don't break mid-word.

### Steps to test:
- Long unbroken names (dataset/task type descriptions, artifact paths, color picker descriptions, large-table cells) still wrap instead of overflowing.
- Column titles in large tables don't break mid-word.

------
- [ ] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [ ] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4b3ab17e6051`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.