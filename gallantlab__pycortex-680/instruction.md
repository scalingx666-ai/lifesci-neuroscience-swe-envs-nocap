# Issue

**Title:** MNT ignore docs build outputs written into the source tree

## Description

Building the docs runs the example gallery, which writes its outputs next to the example sources instead of into `docs/_build` — so `my_flatmap.png/svg`, `flatmap_comparison.gif`, `S1_retinotopy.hdf`, and sphinx-gallery's `sg_execution_times.rst` all showed up as untracked after every local `make html`.

Verified with `git check-ignore` that all five are now ignored and that `git status` is clean after a docs build. No tracked files are affected.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7bf8ba2be9c8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.