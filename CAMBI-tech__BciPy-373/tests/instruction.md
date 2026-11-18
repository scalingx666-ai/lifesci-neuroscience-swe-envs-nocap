# Issue

**Title:** Sim Logging Bugs

## Description

# Overview

Fixed bugs in simulator logging.

## Ticket

https://www.pivotaltracker.com/story/show/188758565

## Contributions

- Ensured that the configure_logger function clears any existing handlers before adding new ones.
- Added unit tests for simulator artifact module to replicate the bug and confirm that it was resolved.
- Fixed a bug in the sim task that occurred during cleanup.
- Added documentation for simulation parameters. One of these controls whether the session.xlsx file is output.

## Test

- Ran all unit tests
- Ran sample simulation

## Discussion

Along with duplicate entries to stdout, the file handlers were also not cleared between runs. This resulted in log statements from subsequent runs being written to all the log files from previous runs. For a large number of runs this potentially resulted in huge log files for the first runs.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7d354b18808b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.