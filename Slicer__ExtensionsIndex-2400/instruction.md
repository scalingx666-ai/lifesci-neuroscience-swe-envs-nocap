# Issue

**Title:** SlicerMorph: switch scm_revision from geomorphTab to master

## Description

SlicerMorph development has moved back to its `master` branch. `master` now carries everything that was on `geomorphTab` (SlicerMorph/SlicerMorph#490, merged), so this changes only the branch name; the code that gets built is the same.

Same change is submitted for the `main` index branch. The `5.10` entry stays on `stable-5.10`.

Tracking: SlicerMorph/SlicerMorph#487

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1f00c715fad3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.