# Issue

**Title:** #181963356 ; fake data alerting

## Description

# Overview

Added better alerting to inform users when fake data mode is on.

## Ticket

https://www.pivotaltracker.com/story/show/181963356

## Contributions

- Added GUI utility for confirmation alerts.
- Set default parameter for fake_data to False.
- Added a confirmation alert in bci_main when fake data is present. The user can confirm to proceed with the task or cancel to stop it.

## Test

- Ran all unit tests.
- Ran a calibration task with the fake_data parameter set to both True and False. Setting to False should not display any alerts. Setting to True should display the alert. Canceling the alert should stop the task. Confirming the alert should proceed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7bed5ee941c8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.