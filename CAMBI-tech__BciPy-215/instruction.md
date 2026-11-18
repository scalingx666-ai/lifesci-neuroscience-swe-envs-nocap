# Issue

**Title:** #181987601 move session script to demo

## Description

# Overview

Moved session_tools script to the helpers/demo folder.

## Ticket

https://www.pivotaltracker.com/story/show/181987601

## Contributions

- Moved session_tools script to the helpers/demo folder.
- Refactored code to use new GUI prompt if directory is not provided.
- Refactored to construct paths with pathlib.
- Code cleanup for pylint warnings.

## Test

- Ran script against some test data using the all possible options (chart, csv, and database).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6637816fff80`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.