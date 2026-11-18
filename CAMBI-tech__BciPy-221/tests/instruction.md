# Issue

**Title:** Matrix Display Fixes

## Description

# Overview

Fixes bug with last stimuli lagging in matrix calibration display.  Added entire grid flash before each inquiry as requested by clinical team.

## Ticket

https://www.pivotaltracker.com/story/show/181991041
https://www.pivotaltracker.com/story/show/181799271

## Contributions

- bcipy/display/paradigm/matrix/display.py: added full grid flash before inquiry; returned all stimuli to original opacity after inquiry to fix the last stimuli lag
- bcipy/task/paradigm/matrix/timing_verification.py: added new full_grid_opacity parameter used in display fixes

## Test

- bcipy --task "Matrix Calibration" --> ensure all stimuli were flashed before inquiry, and lag was removed at the end

## Documentation

- Added comments where applicable. No major updates.

## Changelog

- Is the CHANGELOG.md updated with your detailed changes? No updates needed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1b2bdfb10426`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.