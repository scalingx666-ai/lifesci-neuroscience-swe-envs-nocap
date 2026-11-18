# Issue

**Title:** Model Loading

## Description

# Overview

 Changed model loading behavior to prompt the user using a separate file dialog for each model.

## Ticket

https://www.pivotaltracker.com/story/show/188038501

## Contributions

- Updated the ask_filename utility to optionally take a prompt. Also updated to use the PyQt file dialog, rather than the native dialog; this provides consistency between platforms as they don't always display the prompt.
- Added utility functions to the acquisition helper for getting the active device content types based on the configured acq_mode.
- Added load functions for models.

## Test

- Created unit tests for new functions.
- Initialized Copy Phrase task with different `acq_mode` configurations to confirm that the file prompts were working correctly.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a635baaffb78`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.