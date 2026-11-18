# Issue

**Title:** Device Status

## Description

# Overview

Added active/passive status to devices.

## Ticket

https://www.pivotaltracker.com/story/show/186164071

## Contributions

- Added a new field to `DeviceSpec` for the device status. Updated the loading / saving code to read/write the field. Updated `devices.json` to use a default value of 'active'.
- Updated acquisition.py module to allow for setting this field using the parameters.
- Updated offline_analysis to only train models for active devices.
- Updated Copy Phrase task to only create evidence_evaluators for active devices.
- Added unit tests

## Test

- Ran all unit tests
- Ran a calibration task with "acq_mode": "EEG+Eyetracker:passive", followed by offline analysis to confirm that only the EEG model was trained. Changed the `devices.json` in the calibration folder, ran the offline analysis, and confirmed that the code attempted to train both models.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a8856a03be2b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.