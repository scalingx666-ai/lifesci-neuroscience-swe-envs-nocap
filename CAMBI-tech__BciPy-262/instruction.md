# Issue

**Title:** Matrix calibration refinements

## Description

# Overview

Updated the Matrix Calibration task to display the target in the context of the matrix.

## Ticket

https://www.pivotaltracker.com/story/show/180699453

## Contributions

- Updated the matrix display to show the target within the grid.
- Added color support to the display.
- Fixed configuration issue in Matrix Calibration task.

## Test

- Ran unit tests and matrix demos.
- Ran Matrix Calibration, followed by offline analysis. Used the resulting model in a Matrix Copy Phrase session.


https://user-images.githubusercontent.com/2153447/213519726-3af56f42-04d5-40e6-b015-77d00be57509.mov

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `29df01f679e8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.