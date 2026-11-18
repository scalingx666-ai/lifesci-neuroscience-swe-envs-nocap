# Issue

**Title:** Passive device bug

## Description

# Overview

Fixed a bug related to determining which devices were active in a Copy Phrase task.

## Ticket

https://www.pivotaltracker.com/story/show/186890663

## Test

- Added unit tests isolating the bug.

## Discussion

I had previously fixed this bug locally but forgot to push it before the PR was merged.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `afce1437bb62`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.