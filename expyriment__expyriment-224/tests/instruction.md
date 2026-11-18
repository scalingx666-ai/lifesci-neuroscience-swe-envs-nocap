# Issue

**Title:** Better visual timing test

## Description

- more accurate refresh rate detection
- present (transparent) full screens now instead of single pixel stimuli (better represents real-life stimuli)
- more variable presentation delays (better represents real-life non-consecutive presentations)
- reduced number of presentations from 180 to 100 (for interpreting histogram values as percentages)
- added experimental heuristic for detecting compositor and changing accuracy calculation accordingly

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `98995e773b56`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.