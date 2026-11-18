# Issue

**Title:** Update appveyor.yml

## Description

Also:
- Add cmake macro to set the runtime to static (for windows, will use the compile flag `MT` rather than `MD`)
- Add build status badges (to make the second badge working, the repository needs to be added to AppVeyor first)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d5863c23b1e7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.