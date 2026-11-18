# Issue

**Title:** Stoppage Criteria: max incorrect

## Description

# Overview

Added stoppage criteria to copy phrase tasks to check for a given number of consecutive incorrect. This is set using a new parameter.

## Ticket

https://www.pivotaltracker.com/story/show/188221684

## Contributions

- Function to test for consecutive_incorrect
- Additional parameter
- Stoppage criteria check

## Test

- ran unit tests
- ran a sample copy phrase task with a low number of max_incorrect to confirm that it stops when this number is reached.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `edf838bcf77c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.