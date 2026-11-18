# Issue

**Title:** Lead the README and tutorial with multitaper_connectivity

## Description

The documentation front door for 3.0:

- README and docs index: a first successful `multitaper_connectivity` call comes before any policy text; the returned dims are named right under it; `suggest_parameters` follows with a realistic example (5 tapers, result shown) and a bridging sentence; the fifteen-sentence DataArray contract is now three sentences plus a link to a new doctested cookbook recipe, "Pass a labeled DataArray", whose caveats are split into common cases and error cases.
- The Intro tutorial opens with a Quick start on a plain 2-D array through the wrapper (cropped, explained first plot), then "Under the hood" sections for `Multitaper` and `Connectivity`, with the time-resolved wrapper example folded in where time windows are introduced. The notebook is regenerated and re-executed, and is now part of the notebook-execution test and the CI notebook loop.
- `suggest_parameters` warns when its window clamping would leave fewer than two tapers (the old README example silently produced a single-taper estimate); the warning says what was requested, what resulted, and how to fix it.

Phase 4 of #89; stacked on #92 (retarget to `master` after it merges). Gate green locally: ruff, mypy, doctests, cookbook/docs tests, the slow Intro-notebook execution test, 1586 passed / 16 skipped.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `daa992f2116f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.