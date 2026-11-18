# Issue

**Title:** #183037159 ; alert when using battery power

## Description

# Overview

Added an alert to check for battery power before performing a task.

## Ticket

https://www.pivotaltracker.com/story/show/183037159

## Contributions

- New system utility to check for battery power
- New validation entry

## Test

- Ran unit tests
- Ran calibration task both with laptop plugged in and once while unplugged to confirm that the alert appears correctly.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `115f5e41347a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.