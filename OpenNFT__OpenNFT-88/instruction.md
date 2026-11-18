# Issue

**Title:** rtQA update (LinTrend and MSE), ROI selection and minor fixes

## Description

UPDATES IN RTQA:

Two quality parameters added:
- Linear trend beta coefficient plot for real-time QA;
- Recursive mean-squared error plot for low pass filter performance estimation;

New feature for comfortable analysis of each ROI:
- ROI selection (only first ROI is selected by default; works when scanning is stopped) for time-series visualization in rtQA module;

Refactoring:
- Separation of rtQA functionality and main code;
- Code refactoring and comment.

FIXES:
- Matplotlib depricated method warning

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e0e9e7accaa3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.