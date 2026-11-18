# Issue

**Title:** fix: use existing font instead of redownloading it and other fixes

## Description

Fixes failing tests.

FYI, I pulled the `WM_PAINT` fix from the presentation prediction branch (#7895) to get tests passing on Windows (what I'm working on this week.) Should merge cleanly since they are identical changes.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `95b8a6fb4189`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.