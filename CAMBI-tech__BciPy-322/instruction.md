# Issue

**Title:** VEP calibration session data

## Description

# Overview

Added session.json output for VEP Calibration task to capture data needed for creating a model.

## Ticket

https://www.pivotaltracker.com/story/show/186522989

## Contributions

- Updated task data module to allow for task-specific Inquiry and Session data
- Added properties to display elements useful for recording in the session data.
- Added functionality to VEP Calibration task for outputting session data. General task data includes information about each box (coordinates, colors, flicker rate). Each Inquiry has information about which stimuli were presented in each box, which box contained the target symbol, as well as the flicker rate of that box.

## Test

- Ran all unit tests
- Ran a VEP calibration task and inspected the resulting session.json file.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `04fe4e82ca0a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.