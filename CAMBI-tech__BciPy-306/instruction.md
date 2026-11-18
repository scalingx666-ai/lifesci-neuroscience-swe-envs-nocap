# Issue

**Title:** Task bar bug

## Description

# Overview

Fixed bugs in matrix position calculations and added parameter for task bar spacing.

## Ticket

https://www.pivotaltracker.com/story/show/186539510

## Contributions

- Bug fix in matrix position calculations
- Added height calculation to limit matrix so it won't overlap with the task bar.
- Added parameter to specify the task bar padding.
- Updated demos to use Overpass Mono font.
- Added README for matrix including recommended parameters and information on troubleshooting layout issues.

## Test

- Ran all unit tests
- Ran demos related to matrix displays
- Ran Matrix calibration locally

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4102a83d7fa2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.