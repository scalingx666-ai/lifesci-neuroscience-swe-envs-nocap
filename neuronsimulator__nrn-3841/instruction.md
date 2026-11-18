# Issue

**Title:** docs: add 9.0.2 changelog entry

## Description

## Summary

- Port the public **9.0.2** notes into `docs/changelog.md` on master (post-release housekeeping from #3816).
- Set release date to 10-08-2026; omit process-only material (RTD sneak peek, full commit checklist).

## Test plan

- [ ] Rendered changelog looks correct next to 9.0.1/9.0.0 sections
- [ ] Optional: docs build / RTD preview on the PR

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `67f9cc725c18`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.