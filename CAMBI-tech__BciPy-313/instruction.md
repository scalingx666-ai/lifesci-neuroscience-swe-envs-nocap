# Issue

**Title:** Matrix Grid Always On

## Description

# Overview

Modified the matrix display code so the matrix is always shown in the Calibration and Copy Phrase tasks.

## Ticket

https://www.pivotaltracker.com/story/show/186539584

## Test

- Ran all unit tests
- Ran Matrix calibration to confirm that the display appeared as expected
- Ran Matrix Copy Phrase task

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0e111d25b7b8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.