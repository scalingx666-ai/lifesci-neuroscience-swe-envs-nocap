# Issue

**Title:** docs(readme): show the feed, compile, ask, keep-honest loop

## Description

## Problem
The README explains the workflow only in prose and command lists. Nothing shows at a glance how the pieces fit together, or that each session builds on the last.

## Change
- New `assets/loop.svg`: four steps (Feed → Compile → Ask → Keep honest) with the commands for each and a return arrow, on a solid background so it reads in GitHub dark mode. Colors match the vault's folder palette.
- Added at the top of "What you actually do" in `README.md` and `README_TW.md` (alt text translated). It's linked through `raw.githubusercontent.com`, which serves `image/svg+xml`, so it also renders on PyPI.

Idea adapted from claude-obsidian's knowledge-loop diagram.

## Tests
- `tools/check_readme_sync.py` and `tests/test_readme_sync.py` pass; README/docs tests pass.
- Rendered the SVG locally (qlmanage) and checked that all four boxes, arrows, and the caption fit.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2ce3fd329c30`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.