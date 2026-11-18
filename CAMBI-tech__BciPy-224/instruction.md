# Issue

**Title:** Signal Model Path Parameter

## Description

# Overview

Added a parameter to specify the `signal_model_path`. If provided, this path is used when loading the signal model for typing tasks.

## Ticket

https://www.pivotaltracker.com/story/show/182005453

## Contributions

- New parameter to specify the signal model path.
- Updated the `ask_file` utility to accept an optional directory parameter from which to start.
- Updated the `load` helper.

## Test

- Ran Copy Phrase task without the parameter set to ensure that the original behavior did not change.
- Ran a copy Copy Phrase task with the new parameter set to my calibration directory. Confirmed that the dialog displayed this directory when initialized.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `323b9e2fa81d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.