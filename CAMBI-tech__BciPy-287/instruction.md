# Issue

**Title:** Calib all symbols

## Description

# Overview

Refactored stimuli generation to ensure that all symbols are shown in a calibration.

## Ticket

https://www.pivotaltracker.com/story/show/185235958

## Contributions

- Refactored stimuli generation to be break large functions into smaller units that can be more easily tested and combined.
- Added new criteria for targets (frequency)
- Added test coverage
- Added utility functions for analyzing the statistical properties of symbols in an inquiry schedule.

## Test

- Ran unit tests, including those to ensure that previous criteria are still being met
- Ran a sample calibration to ensure the refactored names were properly integrated in the tasks.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d77bbab3e48a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.