# Issue

**Title:** BUG: Fix remaining bare cout/cerr/endl without std:: prefix

## Description

## Summary
-  — qualify all remaining bare `cout`, `cerr`, and `endl` with `std::` prefix
- Includes both active code and commented-out code, for consistency and so uncommenting works without changes
- Fixes build failure in `TractographyLabelMapSeeding` on Linux with VTK 9.6

## Test plan
- [x] Verify Linux extension build succeeds

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `716120f9f782`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.