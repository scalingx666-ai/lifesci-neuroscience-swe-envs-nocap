# Issue

**Title:** Internet connection alert

## Description

# Overview

Added an alert when the user's computer has an active internet connection.

## Ticket

https://www.pivotaltracker.com/story/show/182200897

## Contributions

- New system utility for checking for an internet connection
- Factored out the functionality for generating the confirmation dialog so multiple conditions could be checked.
- Alert the user when an active internet connection is detected.
- Added GPU logging to the system_info.

## Test

- Ran a session with the internet turned on to confirm a new alert. Ran again with the internet off to test that the alert did not appear. Inspected the log files for the new system_info.
- I was unable to fully test the GPU logging since this is not supported by PyTorch on my computer.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0c95035d9ffe`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.