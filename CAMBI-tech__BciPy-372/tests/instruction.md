# Issue

**Title:** Simulator Trial Data

## Description

# Overview

Added session and session_inquiry fields to simulator Trials data to enable more sampling options.

## Ticket

https://www.pivotaltracker.com/story/show/188673150

## Contributions

- Factored trial data into its own module.
- Added unit tests for some list utility functions
- Added unit tests for converting from ExtractedExperimentData to Trials.

## Test

- Ran all unit tests
- Ran the simulator to confirm other functionality was still working.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dbdc1b5e3f20`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.