# Issue

**Title:** Multi device offset

## Description

# Overview

Refactored trigger decoding to include a parameter for specifying which device to use for the starting_offset.

## Ticket

https://www.pivotaltracker.com/story/show/185905314

## Contributions

- Factored out trigger reading and processing functionality into separate functions
- Added function for searching for the correct starting_offset given a device type
- Refactored existing code to use the new helpers
- Added unit tests

## Test

- Ran all unit tests
- Ran a calibration session locally, followed by offline analysis.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `05e5a69c6900`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.