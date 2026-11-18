# Issue

**Title:** Inquiry Preview Button Evidence Bug

## Description

# Overview

Ensure that button press evidence in Copy Phrase tasks is only produced when presses are meaningful (not in preview-only mode).

## Ticket

https://www.pivotaltracker.com/story/show/188514964

## Contributions

- Added unit tests to replicate the bug
- Implemented a fix

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `be07e59957de`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.